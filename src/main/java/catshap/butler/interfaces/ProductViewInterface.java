package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.ProductView;

public interface ProductViewInterface {

	public abstract ProductView getProduct(int prodNo) throws Exception;

	public abstract int addCount(int prodNo) throws SQLException;

}
