package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.List;

import catshap.butler.bean.OrderProduct;
import catshap.butler.bean.Orders;

public interface OrdersInterface {

	public abstract int insertOrdersAndGetOrdNo(Orders orders) throws SQLException; // 회원 주문 추가

	public abstract int insertOrderProduct(OrderProduct orderProduct) throws SQLException; // 회원 주문 상품 추가

	public abstract List<OrderProduct> getOrderProductList(int userNo) throws SQLException;	// 회원의 주문 상품 리스트 출력
	
	public abstract int getOrderProductPrice(int userNo) throws SQLException; // 회원의 주문 상품 총 가격 출력
	
}
