package catshap.butler.bean;

public class Search {

	private String qsort;
	private String searchKeyword;
	private String searchValue;

	public Search() {
	}

	public Search(String qsort, String searchKeyword, String searchValue) {
		super();
		this.qsort = qsort;
		this.searchKeyword = searchKeyword;
		this.searchValue = searchValue;
	}

	public String getQsort() {
		return qsort;
	}

	public void setQsort(String qsort) {
		this.qsort = qsort;
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

	@Override
	public String toString() {
		return "Search [qsort=" + qsort + ", searchKeyword=" + searchKeyword + ", searchValue=" + searchValue + "]";
	}

}