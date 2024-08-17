package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.List;

import catshap.butler.bean.MyOrderProduct;
import catshap.butler.bean.OrderProduct;

public interface OrderProductInterface {

	public abstract int insertOrderProduct(OrderProduct orderProduct) throws SQLException; // 주문 상품 내역 등록

	public abstract List<MyOrderProduct> getMyOrderProductList(int userNo, String ordStatus) throws SQLException; // 내 주문 상품 내역 리스트 추출

	public abstract int getMyOrderProductCnt(int userNo, String ordStatus) throws SQLException; // 내 주문 상품 내역 총 개수
	
}
