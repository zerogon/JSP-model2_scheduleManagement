package model;

import java.util.Date;

public class BoardFreeVO {
	private int Id;
	private String memberId;
	private String memberNm;
	private String title;
	private String content;
	private String openYn;
	private Date regDate;
	private String formatDate;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOpenYn() {
		return openYn;
	}
	public void setOpenYn(String openYn) {
		this.openYn = openYn;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getFormatDate() {
		return formatDate;
	}
	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}
	@Override
	public String toString() {
		return "BoardFreeVO [Id=" + Id + ", memberId=" + memberId + ", memberNm=" + memberNm + ", title=" + title
				+ ", content=" + content + ", openYn=" + openYn + ", regDate=" + regDate + ", formatDate=" + formatDate
				+ "]";
	}
	
	
	
	
}
