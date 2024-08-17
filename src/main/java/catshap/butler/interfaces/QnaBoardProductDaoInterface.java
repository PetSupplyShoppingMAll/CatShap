package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import catshap.butler.bean.QnaProduct;

public interface QnaBoardProductDaoInterface {
    List<QnaProduct> searchProductsByName(@Param("keyword") String keyword);    

    
    QnaProduct getProductByQnaNo(int qnano) throws SQLException;
}
