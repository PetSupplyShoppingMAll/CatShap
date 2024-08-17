package catshap.butler.dao;

import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.ReviewView;
import catshap.butler.interfaces.ReviewViewInterface;

public class ReviewViewDao implements ReviewViewInterface {

    private static Reader reader = null;
    private static SqlSessionFactory ssf = null;
    
    static {
        try {
            reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
            ssf = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    @Override
    public List<ReviewView> selectReviewList(int prodNo) throws Exception {
        try (SqlSession session = ssf.openSession()) {
            return session.selectList("reviewview.selectReviewList", prodNo);
        }
    }
    
    @Override
    public List<ReviewView> selectUserReviewList(int userNo) throws Exception {
        try (SqlSession session = ssf.openSession()) {
            return session.selectList("reviewview.selectUserReviewList", userNo);
        }
    }
    
    @Override
    public int registReview(ReviewView reviewView) throws SQLException {
        try (SqlSession session = ssf.openSession()) {
            int result = session.insert("reviewview.registReview", reviewView);
            session.commit();
            return result;
        }
    }
    
    @Override
    public List<ReviewView> userReviewPage(int userNo, int page, int pageSize) throws Exception {
        try (SqlSession session = ssf.openSession()) {
            int offset = (page - 1) * pageSize;
            // 전달할 파라미터를 Map으로 구성
            Map<String, Object> params = new HashMap<>();
            params.put("userNo", userNo);
            params.put("offset", offset);
            params.put("pageSize", pageSize);
            
            return session.selectList("reviewview.userReviewPage", params);
        }
    }

    @Override
    public int countUserReviews(int userNo) throws Exception {
        try (SqlSession session = ssf.openSession()) {
            return session.selectOne("reviewview.countUserReviews", userNo);
        }
    }

}
