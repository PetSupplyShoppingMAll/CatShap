package catshap.butler.interfaces;

import catshap.butler.bean.QnaBoard;
import catshap.butler.bean.QnaProduct;
import catshap.butler.bean.Users;

import java.sql.SQLException;
import java.util.List;

public interface QnaBoardInterface {
	
    public abstract List<QnaBoard> listQnaBoard(String qnacatno, String searchKeyword, String searchValue, int userNo) throws SQLException;
    
    
    public abstract int registQnaBoard(QnaBoard qnaBoard) throws SQLException;     
    
    public abstract List<QnaProduct> searchProductsByName(String keyword);
    
    public abstract QnaBoard getQnaBoard(int qnano) throws SQLException;
    
    public abstract Users getUserByUserNo(int userno) throws SQLException; 
    
    
    
}
