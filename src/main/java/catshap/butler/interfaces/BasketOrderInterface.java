package catshap.butler.interfaces;

import java.util.List;

import catshap.butler.bean.BasketOrder;
import catshap.butler.bean.OrderProduct;

public interface BasketOrderInterface {

	 public abstract void placeOrder(BasketOrder order, List<OrderProduct> orderProducts) throws Exception;
	
}
