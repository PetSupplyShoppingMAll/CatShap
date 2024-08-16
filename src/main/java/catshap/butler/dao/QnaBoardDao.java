package catshap.butler.dao;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.QnaBoard;
import catshap.butler.bean.Search;
import catshap.butler.interfaces.QnaBoardInterface;

public class QnaBoardDao implements QnaBoardInterface {

	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;

	static {
		try {
			reader = Resources.getResourceAsReader("conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public List<QnaBoard> listQnaBoard(String qsort, String searchKeyword, String searchValue) throws SQLException {
		Search search = new Search(qsort, searchKeyword, searchValue);
		return ssf.openSession().selectList("qna.selectQnaBoardList", search);
	}

	@Override
	public QnaBoard getQnaBoard(int qnano) throws SQLException {
		SqlSession ss = ssf.openSession();
		QnaBoard qnaBoard = ss.selectOne("board.getQnaBoard", qnano);
		ss.close();
		return qnaBoard;
	}

	@Override
	public int insertQnaBoard(QnaBoard qnaBoard) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("board.registBoard", qnaBoard);
		ss.commit();
		ss.close();
		return result;
	}

	@Override
	public int updateQnaBoard(QnaBoard qnaBoard) throws SQLException {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("board.updateBoard", qnaBoard);
		ss.commit();
		ss.close();
		return result;
	}

	@Override
	public int deleteQnaBoard(int qnano) throws SQLException {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("board.deleteBoard", qnano);
		ss.commit();
		ss.close();
		return result;
	}
}