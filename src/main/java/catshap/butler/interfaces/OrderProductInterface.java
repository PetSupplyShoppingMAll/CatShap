package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.OrderProduct;

public interface OrderProductInterface {

	public abstract int insertOrderProduct(OrderProduct orderProduct) throws SQLException; // 주문 상품 내역 등록

}
