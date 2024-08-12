package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.ProductPrice;

public interface ProductPriceInterface {

	public abstract ProductPrice getProductPrice(int prodNo) throws SQLException;
	
}
