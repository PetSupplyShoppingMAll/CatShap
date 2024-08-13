package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Delivery;

public interface DeliveryInterface {

	public abstract int registDelivery(Delivery delivery) throws SQLException;
	
}
