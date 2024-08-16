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

import catshap.butler.bean.ReviewView;
import catshap.butler.bean.Users;
import catshap.butler.dao.ReviewViewDao;
import catshap.butler.interfaces.ReviewViewInterface;

@WebServlet("/getReviews")
public class UserGetReviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1156746531545L;
    private ReviewViewInterface reviewDao;

    @Override
    public void init() throws ServletException {
        // Initialize ReviewViewDao directly
        reviewDao = new ReviewViewDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }

        int userNo = user.getUserNo();
        System.out.println("UserNo from session: " + userNo);

        try {
            // Fetch the reviews for the user
            List<ReviewView> reviews = reviewDao.selectUserReviewList(userNo);
            
            // Set the response type to JSON
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            // Write the reviews as JSON
            out.print(gson.toJson(reviews));
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving reviews");
        }
    }
}
