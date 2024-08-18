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

import catshap.butler.bean.ReviewView;
import catshap.butler.bean.Users;
import catshap.butler.dao.ReviewViewDao;
import catshap.butler.interfaces.ReviewViewInterface;

@WebServlet("/getReviews")
public class UserGetReviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1156746531545L;
    private ReviewViewInterface ri;

    @Override
    public void init() throws ServletException {
        // Initialize ReviewViewDao directly
        ri = new ReviewViewDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        int userNo = user.getUserNo();
        try {
            List<ReviewView> reviews = ri.selectUserReviewList(userNo);

            // 응답 객체 생성
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.add("reviews", new Gson().toJsonTree(reviews));

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse.toString()); // 응답 객체를 JSON으로 변환하여 출력
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving reviews");
        }
    }

}
