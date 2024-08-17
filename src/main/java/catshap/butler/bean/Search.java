package catshap.butler.bean;

public class Search {

	private String qnacatno;
	private String searchKeyword;
	private String searchValue;
	private int userNo;

	public Search() {
	}

	public Search(String qnacatno, String searchKeyword, String searchValue) {
		super();
		this.qnacatno = qnacatno;
		this.searchKeyword = searchKeyword;
		this.searchValue = searchValue;
	}

	public String getQnacatno() {
		return qnacatno;
	}

	public void setQnacatno(String qnacatno) {
		this.qnacatno = qnacatno;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Search [qnacatno=" + qnacatno + ", searchKeyword=" + searchKeyword + ", searchValue=" + searchValue
				+ "]";
	}
}
