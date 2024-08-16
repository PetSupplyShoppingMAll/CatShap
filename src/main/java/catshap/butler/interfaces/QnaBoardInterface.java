package catshap.butler.interfaces;

import catshap.butler.bean.QnaBoard;
import java.sql.SQLException;
import java.util.List;

public interface QnaBoardInterface {

	public abstract List<QnaBoard> listQnaBoard(String qsort, String searchKeyword, String searchValue)
			throws SQLException;

	public abstract QnaBoard getQnaBoard(int qnano) throws SQLException;

	public abstract int insertQnaBoard(QnaBoard qnaBoard) throws SQLException;

	public abstract int updateQnaBoard(QnaBoard qnaBoard) throws SQLException;

	public abstract int deleteQnaBoard(int qnano) throws SQLException;
	
}