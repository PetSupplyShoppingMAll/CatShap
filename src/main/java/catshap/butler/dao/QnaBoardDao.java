package catshap.butler.dao;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Users;
import catshap.butler.bean.QnaBoard;
import catshap.butler.bean.QnaProduct;
import catshap.butler.bean.Search;
import catshap.butler.interfaces.QnaBoardInterface;

public class QnaBoardDao implements QnaBoardInterface {

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
    public List<QnaBoard> listQnaBoard(String qnacatno, String searchKeyword, String searchValue, int userNo) throws SQLException {
        Search search = new Search(qnacatno, searchKeyword, searchValue);
        search.setUserNo(userNo);
        
        try (SqlSession session = ssf.openSession()) {
            return session.selectList("qnaBoard.selectQnaBoard", search);
        }
    }

  
    @Override
    public int registQnaBoard(QnaBoard qnaBoard) throws SQLException {
        SqlSession ss = ssf.openSession();
        int result = ss.insert("qnaBoard.registQnaBoard", qnaBoard);
        ss.commit();
        ss.close();
        return result;        
    }
    
    public QnaBoard getQnaBoard(int qnano) throws SQLException {
        SqlSession ss = ssf.openSession();
        QnaBoard board = ss.selectOne("qnaBoard.getQnaBoard", qnano);
        ss.close();
        return board;
    	
    }


    @Override
    public List<QnaProduct> searchProductsByName(String keyword) {
        try (SqlSession session = ssf.openSession()) {
            return session.selectList("catshap.butler.interfaces.QnaBoardProductDaoInterface.getProductByQnaNo", keyword);
        }
    }   
    
    @Override
    public Users getUserByUserNo(int userno) throws SQLException {
        try (SqlSession session = ssf.openSession()) {
            return session.selectOne("qnaBoard.getUserByUserNo", userno);
        }
    }
    
}
    
    
