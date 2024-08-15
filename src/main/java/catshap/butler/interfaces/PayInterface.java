package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Pay;

public interface PayInterface {

	public abstract int insertPay(Pay pay) throws SQLException; // 결제 정보 등록

}
