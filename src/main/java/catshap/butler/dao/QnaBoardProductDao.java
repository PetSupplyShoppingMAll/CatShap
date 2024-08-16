package catshap.butler.dao;

import catshap.butler.interfaces.QnaBoardProductDaoInterface;
import catshap.butler.bean.QnaProduct;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class QnaBoardProductDao implements QnaBoardProductDaoInterface {
	private SqlSessionFactory sqlSessionFactory;

	public QnaBoardProductDao(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<QnaProduct> searchProductsByName(String keyword) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("catshap.butler.interfaces.QnaBoardProductDaoInterface.searchProductsByName",
					keyword);
		}
	}
}