package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.List;

import catshap.butler.bean.Basket;

public interface BasketInterface {

	public abstract Basket getBasket(int userNo, int prodNo) throws SQLException; // 특정 장바구니 내역 확인

	public abstract List<Basket> listBasket(int	userNo) throws Exception;

	public abstract boolean addToBasket(Basket basket) throws Exception;

	public abstract int deleteBasket(int basketNo) throws Exception;

	public abstract boolean isProductInBasket(int userNo, int prodNo) throws Exception;

	public abstract void removeProductFromBasket(int userNo, int prodNo) throws Exception;

}
