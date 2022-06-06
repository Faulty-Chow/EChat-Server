package activate;

import entity.ChatSession;
import entity.User;
import org.json.JSONArray;
import org.json.JSONObject;
import server.CommandManager;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class AndroidListActivity extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/x-www-form-urlencoded;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        Cookie[] cookies = req.getCookies();
        int chatType = Integer.parseInt(req.getParameter("chatType"));

        PrintWriter out = resp.getWriter();
        String result = null;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("chatType", chatType);
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("browser_uid")) {
                if (chatType == 0) {    // Group Chat
                    List<ChatSession> sessions = null;
                    try {
                        sessions = CommandManager.getChatSessions(cookie.getValue());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    JSONArray jsonArray = new JSONArray();
                    for (int i = 0; i < sessions.size(); i++) {
                        Map params = new HashMap();
                        params.put("sessionId", sessions.get(i).getId());
                        params.put("sessionName", sessions.get(i).getSessionName());
                        params.put("ownerId", sessions.get(i).getOwnerId());
                        params.put("members", sessions.get(i).getSessionMemberIds());
                        jsonArray.put(i, params);
                    }
                    jsonObject.put("chatList", jsonArray);
                    result = URLEncoder.encode(jsonObject.toString(), "UTF-8");
                    System.out.println(result);
                    out.write(result);
                } else if (chatType == 1) {    // Private Chat
                    List<User> users = new ArrayList<>();
                    try {
                        users = CommandManager.getAllUsers(cookie.getValue());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    JSONArray jsonArray = new JSONArray();
                    for (int i = 0; i < users.size(); i++) {
                        Map params = new HashMap();
                        params.put("username", users.get(i).getId());
                        params.put("nickname", users.get(i).getNickname());
                        jsonArray.put(i, params);
                    }
                    jsonObject.put("chatList", jsonArray);
                    result = URLEncoder.encode(jsonObject.toString(), "UTF-8");
                    System.out.println(result);
                    out.write(result);
                }
            }
            out.flush();
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
