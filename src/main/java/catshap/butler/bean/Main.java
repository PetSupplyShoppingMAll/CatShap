package catshap.butler.bean;

public class Main {
	private String prodtitlename;
	private String prodimgpath;
	private String prodprice;
	private String proddetailname;
	private int prodNo;

	public Main() {
	}

	public Main(String prodtitlename, String prodimgpath, String prodprice, String proddetailname, int prodNo) {
		super();
		this.prodtitlename = prodtitlename;
		this.prodimgpath = prodimgpath;
		this.prodprice = prodprice;
		this.proddetailname = proddetailname;
		this.prodNo = prodNo;
	}

	public String getProdtitlename() {
		return prodtitlename;
	}

	public void setProdtitlename(String prodtitlename) {
		this.prodtitlename = prodtitlename;
	}

	public String getProdimgpath() {
		return prodimgpath;
	}

	public void setProdimgpath(String prodimgpath) {
		this.prodimgpath = prodimgpath;
	}

	public String getProdprice() {
		return prodprice;
	}

	public void setProdprice(String prodprice) {
		this.prodprice = prodprice;
	}

	public String getProddetailname() {
		return proddetailname;
	}

	public void setProddetailname(String proddetailname) {
		this.proddetailname = proddetailname;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	@Override
	public String toString() {
		return "Main [prodtitlename=" + prodtitlename + ", prodimgpath=" + prodimgpath + ", prodprice=" + prodprice
				+ ", proddetailname=" + proddetailname + ", prodNo=" + prodNo + "]";
	}

}// class