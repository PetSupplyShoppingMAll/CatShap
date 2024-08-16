package catshap.butler.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.ReviewView;
import catshap.butler.bean.UserQnA;
import catshap.butler.interfaces.UserQnAInterFace;

public class UserQnADao implements UserQnAInterFace{
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
	public List<UserQnA> selectUserQnAList(int userNo) throws Exception {
	        try (SqlSession session = ssf.openSession()) {
	            return session.selectList("userqna.selectUserQnAList", userNo);
	        }
	}
}
