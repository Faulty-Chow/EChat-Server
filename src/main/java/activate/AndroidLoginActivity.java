package activate;

import entity.User;
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

import static server.CommandManager.*;

public class AndroidLoginActivity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=utf-8");
//        resp.setCharacterEncoding("UTF-8");
//
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//        String result = "";
//
//        System.out.println("username = " + username);
//        System.out.println("password = " + password);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
        PrintWriter out = resp.getWriter();
        String result = null;

        resp.setContentType("text/html;charset=utf-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Cookie[] cookies = req.getCookies();
        String cookie = null;

        JSONObject jsonObject = new JSONObject();

        if (cookies.length == 1) {
            cookie = cookies[0].getValue();
            Cookie uid_cookie = new Cookie("browser_uid", cookie);
            uid_cookie.setMaxAge(24 * 60 * 60);    //一天
            resp.addCookie(uid_cookie);
        } else {
            for (Cookie c : cookies) {
                if (c.getName().equals("browser_uid")) {
                    cookie = c.getValue();
                    break;
                }
            }
            if (cookie == null) {
                throw new RuntimeException("no browser_uid");
            }
        }
        System.out.println("cookie: " + cookie);

        if (!isCorrectUser(username, password, cookie)) {
            System.out.println("用户名/密码错误");
            jsonObject.put("status", "error");
            jsonObject.put("errorMsg", URLEncoder.encode("用户名/密码错误", "UTF-8"));
        } else {
            System.out.println("login success");
            jsonObject.put("status", "success");
            jsonObject.put("uuid", cookie);
            jsonObject.put("username", username);
            jsonObject.put("password", password);
            try {
                User user = CommandManager.getUser(cookie);
                jsonObject.put("nickname", user.getNickname());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        result = URLEncoder.encode(jsonObject.toString(), "UTF-8");
        out.write(result);
        out.flush();
        out.close();
    }

    private boolean isCorrectUser(String id, String pwd, String cookie) {
        try {
            if (!login(id, pwd, cookie)) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }
}
