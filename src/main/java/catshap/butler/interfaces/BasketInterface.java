package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Basket;

public interface BasketInterface {

	public abstract Basket getBasket(int userNo, int prodNo) throws SQLException; // 특정 장바구니 내역 확인

}
