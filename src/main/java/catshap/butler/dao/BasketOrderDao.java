package catshap.butler.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Basket;
import catshap.butler.bean.BasketOrder;
import catshap.butler.bean.OrderProduct;
import catshap.butler.interfaces.BasketInterface;
import catshap.butler.interfaces.BasketOrderInterface;

public class BasketOrderDao implements BasketOrderInterface {

	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;
	
	static {
		try {
			reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@Override
	public void placeOrder(BasketOrder order, List<OrderProduct> orderProducts) throws Exception {
	    SqlSession ss = ssf.openSession();
	    try {
	        // 1. 주문 정보 삽입
	        ss.insert("orderproduct.insertOrder", order);

	        // 2. 방금 삽입된 주문 번호 가져오기
	        int orderNo =  ss.selectOne("orderproduct.getLastOrderNo");
	        System.out.println("Inserted Order No: " + orderNo); // 디버깅 코드

	        // 3. 각 상품에 대해 주문 상품 테이블에 삽입
	        for (OrderProduct orderProduct : orderProducts) {
	            orderProduct.setOrdNo(orderNo);
	            System.out.println("Inserting Product: " + orderProduct); // 디버깅 코드
	            ss.insert("orderproduct.insertOrderProducts2", orderProduct);
	        }
	        
	        // 커밋
	        ss.commit();
	    } catch (Exception e) {
	        ss.rollback();
	        e.printStackTrace(); // 예외를 출력
	        throw e;
	    } finally {
	        ss.close();
	    }
	}

}
