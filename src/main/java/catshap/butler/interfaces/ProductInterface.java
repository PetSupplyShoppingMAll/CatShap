package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.List;

import catshap.butler.bean.Product;

public interface ProductInterface {

	public abstract Product selectProduct(int prodNo);

	public abstract List<Product> selectAll(String category);

	public abstract List<Product> selectBasketProductList(int userNo) throws SQLException;

}
