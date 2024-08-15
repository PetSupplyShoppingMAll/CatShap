package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Delivery;

public interface DeliveryInterface {

	public abstract int insertDelivery(Delivery delivery) throws SQLException; // 배달 정보 등록

}
