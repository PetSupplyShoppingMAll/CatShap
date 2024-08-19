package catshap.butler.bean;

import java.sql.Timestamp;

public class QnaBoard  {

	private int qnano; // QnA 번호
	private int userno; // 사용자 번호_참조
	private int prodno; // 상품번호_참조
	private int qnacatno; // 카타로그 no_참조
	private String qnatitle; // 제목
	private String qnatext; // 내용
	private Timestamp qnaregdate; // 등록날짜
	private Timestamp qnaupdate; // 수정날짜
	private String prodImgPath;
	private String uname;

	public QnaBoard() {
	}

	public QnaBoard(int qnano, int userno, int prodno, int qnacatno, String qnatitle, String qnatext,
			Timestamp qnaregdate, Timestamp qnaupdate, String prodImgPath, String uname) {
		super();
		this.qnano = qnano;
		this.userno = userno;
		this.prodno = prodno;
		this.qnacatno = qnacatno;
		this.qnatitle = qnatitle;
		this.qnatext = qnatext;
		this.qnaregdate = qnaregdate;
		this.qnaupdate = qnaupdate;
		this.prodImgPath = prodImgPath;
		this.uname = uname;
	}

	public int getQnano() {
		return qnano;
	}

	public void setQnano(int qnano) {
		this.qnano = qnano;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getProdno() {
		return prodno;
	}

	public void setProdno(int prodno) {
		this.prodno = prodno;
	}

	public int getQnacatno() {
		return qnacatno;
	}

	public void setQnacatno(int qnacatno) {
		this.qnacatno = qnacatno;
	}

	public String getQnatitle() {
		return qnatitle;
	}

	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}

	public String getQnatext() {
		return qnatext;
	}

	public void setQnatext(String qnatext) {
		this.qnatext = qnatext;
	}

	public Timestamp getQnaregdate() {
		return qnaregdate;
	}

	public void setQnaregdate(Timestamp qnaregdate) {
		this.qnaregdate = qnaregdate;
	}

	public Timestamp getQnaupdate() {
		return qnaupdate;
	}

	public void setQnaupdate(Timestamp qnaupdate) {
		this.qnaupdate = qnaupdate;
	}

	public String getProdImgPath() {
		return prodImgPath;
	}

	public void setProdImgPath(String prodImgPath) {
		this.prodImgPath = prodImgPath;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "QnaBoard [qnano=" + qnano + ", userno=" + userno + ", prodno=" + prodno + ", qnacatno=" + qnacatno
				+ ", qnatitle=" + qnatitle + ", qnatext=" + qnatext + ", qnaregdate=" + qnaregdate + ", qnaupdate="
				+ qnaupdate + ", prodImgPath=" + prodImgPath + ", uname=" + uname + "]";
	}

}
