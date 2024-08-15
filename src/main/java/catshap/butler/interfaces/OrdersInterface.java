package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.Map;

import catshap.butler.bean.OrderProduct;
import catshap.butler.bean.Orders;

public interface OrdersInterface {

	public abstract int getBeforeOrders(Map<String, Object> userParams) throws SQLException; // 과거 주문한 사용자인지 판단

	public abstract int insertOrdersAndGetOrdNo(Orders orders) throws SQLException; // 회원 주문 추가

	public abstract int insertOrderProduct(OrderProduct orderProduct) throws SQLException; // 회원 주문 상품 추가

	public abstract int getOrderProductPrice(int userNo) throws SQLException; // 회원의 주문 상품 총 가격 출력

}
