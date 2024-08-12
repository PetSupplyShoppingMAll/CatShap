package catshap.butler.bean;

import java.sql.Timestamp;

public class ProductPrice {

	private int prodNo; // 상품번호
	private Timestamp prodRegdate; // 상품등록일시
	private int prodPrice; // 상품가격

	public ProductPrice() {
	}

	public ProductPrice(int prodNo, Timestamp prodRegdate, int prodPrice) {
		super();
		this.prodNo = prodNo;
		this.prodRegdate = prodRegdate;
		this.prodPrice = prodPrice;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public Timestamp getProdRegdate() {
		return prodRegdate;
	}

	public void setProdRegdate(Timestamp prodRegdate) {
		this.prodRegdate = prodRegdate;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	@Override
	public String toString() {
		return "ProductPrice [prodNo=" + prodNo + ", prodRegdate=" + prodRegdate + ", prodPrice=" + prodPrice + "]";
	}

}
