package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.Map;

public interface ProductPriceInterface {

	public abstract int getProdPrice(Map<String, Object> productParams) throws SQLException; // 주문 총가격 반환

}
