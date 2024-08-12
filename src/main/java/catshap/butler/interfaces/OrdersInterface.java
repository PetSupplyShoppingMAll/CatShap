package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Orders;

public interface OrdersInterface {

	public abstract int insertOrders(Orders orders) throws SQLException;	// 사용자 선택한 상품 주문 추가
	
}
