package catshap.butler.interfaces;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import catshap.butler.bean.QnaProduct;

public interface QnaBoardProductDaoInterface {

	List<QnaProduct> searchProductsByName(@Param("keyword") String keyword);

}