package catshap.butler.dao;

import catshap.butler.interfaces.QnaBoardProductDaoInterface;
import catshap.butler.bean.QnaBoard;
import catshap.butler.bean.QnaProduct;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

public class QnaBoardProductDao implements QnaBoardProductDaoInterface {

    private static SqlSessionFactory ssf = null;

    // 기본 생성자 추가
    public QnaBoardProductDao() {
        try {
            Reader reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
            ssf = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public QnaBoardProductDao(SqlSessionFactory sqlSessionFactory) {
        this.ssf = sqlSessionFactory;
    }

    @Override
    public List<QnaProduct> searchProductsByName(String keyword) {
        try (SqlSession session = ssf.openSession()) {
            return session.selectList("catshap.butler.interfaces.QnaBoardProductDaoInterface.searchProductsByName", keyword);
        }
    }
    
    @Override
    public QnaProduct getProductByQnaNo(int qnano) {
        try (SqlSession session = ssf.openSession()) {
            return session.selectOne("catshap.butler.interfaces.QnaBoardProductDaoInterface.getProductByQnaNo", qnano);
        }
    } 
}
    

