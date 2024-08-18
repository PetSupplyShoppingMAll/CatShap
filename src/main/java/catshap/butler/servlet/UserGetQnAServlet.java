package catshap.butler.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import catshap.butler.bean.UserQnA;
import catshap.butler.bean.Users;
import catshap.butler.dao.UserQnADao;
import catshap.butler.interfaces.UserQnAInterFace;

@WebServlet("/getQnAs")
public class UserGetQnAServlet extends HttpServlet {

    private static final long serialVersionUID = 11564632032545L;
    private UserQnAInterFace qi;

    @Override
    public void init() throws ServletException {
        // Initialize UserQnADao directly
        qi = new UserQnADao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        int userNo = user.getUserNo();

        try {
            // Get the list of QnA
            List<UserQnA> qna = qi.selectUserQnAList(userNo);

            // Create a JsonObject to hold the response
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.add("qna", new Gson().toJsonTree(qna));

            // Set the response type to JSON
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            // Write the JsonObject as the response
            Gson gson = new Gson();
            out.print(gson.toJson(jsonResponse));
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving QnAs");
        }
    }
}
