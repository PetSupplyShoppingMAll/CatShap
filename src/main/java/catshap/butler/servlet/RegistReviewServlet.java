package catshap.butler.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

import catshap.butler.bean.ReviewView;
import catshap.butler.dao.ReviewViewDao;
import catshap.butler.interfaces.ReviewViewInterface;

@WebServlet("/RegistReview")
public class RegistReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 126574856513248651L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        ReviewView review = gson.fromJson(request.getReader(), ReviewView.class);

        // userNo와 prodNo가 올바르게 전달되었는지 확인
        if (review.getUserNo() == 0 || review.getProdNo() == 0) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write(gson.toJson(new ResponseMessage(false)));
            return;
        }

        ReviewViewInterface reviewDao = new ReviewViewDao();
        try {
            int result = reviewDao.registReview(review);
            response.setContentType("application/json");
            response.getWriter().write(gson.toJson(new ResponseMessage(result > 0)));
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(gson.toJson(new ResponseMessage(false)));
        }
    }

    // 응답 메시지 클래스
    private static class ResponseMessage {
        private boolean success;

        public ResponseMessage(boolean success) {
            this.success = success;
        }

        public boolean isSuccess() {
            return success;
        }
    }
}
