package catshap.butler.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import catshap.butler.bean.Grade;
import catshap.butler.bean.Users;
import catshap.butler.dao.UserDao;
import catshap.butler.interfaces.UserInterface;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 115648641352156L;
    private UserInterface userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Users user = new Users();
        user.setUsid(request.getParameter("usid"));
        user.setUpass(request.getParameter("upass"));

        JsonObject jsonResponse = new JsonObject();

        try {
            user = userDao.getUser(user);
            HttpSession session = request.getSession();

            if (user != null) {
                // 사용자 정보를 세션에 저장
                session.setAttribute("user", user);

                // 사용자 등급 정보를 조회하고 세션에 저장
                Grade grade = userDao.getUserGrade(user.getUserNo());
                String gradeName = (grade != null) ? grade.getGname() : "Unknown";  // grade.getGname() 메서드로 등급 이름 가져오기
                session.setAttribute("userGrade", gradeName);

                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("uname", user.getUname());
                jsonResponse.addProperty("unick", user.getUnick());
            } else {
                jsonResponse.addProperty("success", false);
            }

            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse.toString());
            out.flush();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
