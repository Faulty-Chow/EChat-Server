package activate;

import entity.ChatSession;
import entity.Message;
import entity.Msg;
import org.json.JSONArray;
import org.json.JSONObject;
import server.CommandManager;
import server.WebsocketDriver;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

public class AndroidChatActivity extends HttpServlet {
    public static final int GET_MESSAGE_ACTION_CODE = 0;
    public static final int SEND_MESSAGE_ACTION_CODE = 1;
    public static final int GROUP_CHAT_CODE = 0;
    public static final int PRIVATE_CHAT_CODE = 1;

    private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/x-www-form-urlencoded;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String result = null;

        Cookie[] cookies = req.getCookies();
        int actionCode = Integer.parseInt(req.getParameter("actionCode"));
        int chatType = Integer.parseInt(req.getParameter("chatType"));

        if (actionCode == GET_MESSAGE_ACTION_CODE) {
            JSONArray jsonArray = new JSONArray();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("browser_uid")) {
                    if (chatType == PRIVATE_CHAT_CODE) {    // Private Chat
                        String oppUsername = req.getParameter("chatId");
                        try {
                            List<Message> messages = CommandManager.getMessageList(cookie.getValue(), oppUsername);
                            for (Message message : messages) {
                                JSONObject jsonObject = new JSONObject();
                                jsonObject.put("fromId", message.getFromUserId());
                                jsonObject.put("toId", message.getToUserId());
                                jsonObject.put("content", message.getContent());
                                jsonObject.put("sendTime", df.format(message.getSendTime()));
                                jsonArray.put(jsonObject);
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                    } else if (chatType == GROUP_CHAT_CODE) {
                        String sessionId = req.getParameter("chatId");
                        try {
                            List<Msg> messages = CommandManager.getSessionMsg(cookie.getValue(), sessionId);
                            for (Msg message : messages) {
                                JSONObject jsonObject = new JSONObject();
                                jsonObject.put("fromId", message.getFromUserId());
                                jsonObject.put("toId", message.getToSessionId());
                                jsonObject.put("content", message.getContent());
                                jsonObject.put("sendTime", df.format(message.getSendTime()));
                                jsonArray.put(jsonObject);
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                    }
                    result = URLEncoder.encode(jsonArray.toString(), "UTF-8");
                    out.write(result);
                    break;
                }
            }
        } else if (actionCode == SEND_MESSAGE_ACTION_CODE) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("browser_uid")) {
                    String message = URLDecoder.decode(req.getParameter("message"), "UTF-8");
                    JSONObject jsonObject = new JSONObject(message);
                    String fromId = jsonObject.getString("fromId");
                    String toId = jsonObject.getString("toId");
                    String content = jsonObject.getString("content");
                    if (chatType == PRIVATE_CHAT_CODE) {    // Private Chat
                        try {
                            Message msg = CommandManager.sendMessageToUser(cookie.getValue(), toId, content);
                            if (msg != null) {
                                jsonObject.put("status", true);
                                jsonObject.put("sendTime", df.format(msg.getSendTime()));
                                WebsocketDriver.sendMessage(msg, toId);
                            } else {
                                jsonObject.put("status", false);
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                    } else if (chatType == GROUP_CHAT_CODE) {
                        try {
                            Msg msg = CommandManager.sendMessageToSession(cookie.getValue(), toId, content);
                            if (msg != null) {
                                jsonObject.put("status", true);
                                jsonObject.put("sendTime", df.format(msg.getSendTime()));
                                ChatSession session = CommandManager.getChatSession(cookie.getValue(), toId);
                                if (session != null) {
                                    session.getSessionMembers().forEach(member -> {
                                        if (!member.getId().equals(fromId)) {
                                            WebsocketDriver.sendMessage(msg, member);
                                        }
                                    });
                                }else {
                                    throw new RuntimeException("session is null");
                                }
                            } else {
                                jsonObject.put("status", false);
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                    }
                    result = URLEncoder.encode(jsonObject.toString(), "UTF-8");
                    out.write(result);
                    break;
                }
            }
        }

        out.flush();
        out.close();

    }
}
