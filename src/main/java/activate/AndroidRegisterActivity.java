package activate;

import org.json.JSONObject;
import server.CommandManager;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;

import static server.CommandManager.login;

public class AndroidRegisterActivity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
        PrintWriter out = resp.getWriter();
        String result = null;
        //设置客户端的解码方式为utf-8
        resp.setContentType("application/x-www-form-urlencoded;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        JSONObject jsonObject = HttpUtil.getRequestJsonObject(req);

        String username = jsonObject.getString("username");
        String password = jsonObject.getString("password");
        String nickname = jsonObject.getString("nickname");
        nickname = URLDecoder.decode(nickname, "UTF-8");

        JSONObject respJSON = new JSONObject();

        try {
            if (!CommandManager.signUp(username, nickname, password)) {
                System.out.println("注册失败");
                respJSON.put("status", "fail");
                respJSON.put("errCode", "1");
            } else {
                System.out.println("注册成功");
                respJSON.put("status", "success");
                respJSON.put("username", username);
                respJSON.put("password", password);
            }
            result = respJSON.toString();
            out.write(result);
            out.flush();
            out.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
