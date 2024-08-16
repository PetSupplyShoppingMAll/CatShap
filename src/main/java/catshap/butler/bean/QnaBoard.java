package catshap.butler.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class QnaBoard implements Serializable {

	public static final long serialVersionUID = 2398478293479L;

	private int qnano; // QnA 번호
	private int userno; // 사용자 번호_참조
	private int prodno; // 상품번호_참조
	private int qnacatno; // 카타로그 no_참조
	private String qnatitle; // 제목
	private String qnatext; // 내용
	private Timestamp qnaregdate; // 등록날짜
	private Timestamp qnaupdate; // 수정날짜
	private String qsort; // 정렬

	public QnaBoard() {
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

	public String getQsort() {
		return qsort;
	}

	public void setQsort(String qsort) {
		this.qsort = qsort;
	}

	@Override
	public String toString() {
		return "QnaBoard [qnano=" + qnano + ", userno=" + userno + ", prodno=" + prodno + ", qnacatno=" + qnacatno
				+ ", qnatitle=" + qnatitle + ", qnatext=" + qnatext + ", qnaregdate=" + qnaregdate + ", qnaupdate="
				+ qnaupdate + ", qsort=" + qsort + "]";
	}

	public QnaBoard(int qnano, int userno, int prodno, int qnacatno, String qnatitle, String qnatext, String qnaimg1,
			String qnaimg2, Timestamp qnaregdate, Timestamp qnaupdate, String qsort) {
		super();
		this.qnano = qnano;
		this.userno = userno;
		this.prodno = prodno;
		this.qnacatno = qnacatno;
		this.qnatitle = qnatitle;
		this.qnatext = qnatext;
		this.qnaregdate = qnaregdate;
		this.qnaupdate = qnaupdate;
		this.qsort = qsort;
	}

}