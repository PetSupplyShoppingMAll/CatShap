package catshap.butler.servlet;

import catshap.butler.dao.QnaBoardProductDao;
import catshap.butler.bean.QnaProduct;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

@WebServlet(name = "ProductSearchServlet", urlPatterns = "/searchProduct")
public class ProductSearchServlet extends HttpServlet {
    private QnaBoardProductDao qnaBoardProductDao;

    @Override
    public void init() throws ServletException {
        try {
            Reader reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
            qnaBoardProductDao = new QnaBoardProductDao(sqlSessionFactory);
        } catch (IOException e) {
            throw new ServletException("Error initializing SqlSessionFactory", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        try {
            List<QnaProduct> products = qnaBoardProductDao.searchProductsByName(keyword);
            request.setAttribute("products", products);
            RequestDispatcher dispatcher = request.getRequestDispatcher("qnaproductsearch.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error during product search");
            System.out.println("Keyword: " + keyword);
        }
    }
}
