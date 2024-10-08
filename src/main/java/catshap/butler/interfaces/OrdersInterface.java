package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.Map;

import catshap.butler.bean.OrderProduct;
import catshap.butler.bean.Orders;

public interface OrdersInterface {

	public abstract int insertOrdersAndGetOrdNo(Orders orders) throws SQLException; // 회원 주문 추가

	public abstract int insertOrderProduct(OrderProduct orderProduct) throws SQLException; // 회원 주문 상품 추가

	public abstract Orders getOrder(int userNo) throws SQLException; // 주문 내역이 존재하는지 확인

	public abstract int updateOrder(Orders order) throws SQLException; // 주문 내역 존재시 해당 주문 업데이트

	public abstract int updateOrderStatus(Map<String, Object> orderParams) throws SQLException; // 주문 내역 상태 업데이트

}
