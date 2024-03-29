package model;



public class UserVO {
	private int Id;
	private String memberId;
	//@NotEmpty
	//@Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%^&+=])(?=\\S+$).{5,}")	
	private String memberPwd;
	//@NotEmpty
	//@Length(min=3)
	private String memberNm;
	private int dptNo;
	private int grade;
	private int useyn;
	private String createDate;
	private String likedDpr;
	private String likedDest;
	private int holiday;
	private float monthHoliday;
	private float alterHoliday;
	private DptVO dptVO;
	

	
	
	
	
	
	
	public DptVO getDptVO() {
		return dptVO;
	}
	public void setDptVO(DptVO dptVO) {
		this.dptVO = dptVO;
	}
	public float getAlterHoliday() {
		return alterHoliday;
	}
	public void setAlterHoliday(float alterHoliday) {
		this.alterHoliday = alterHoliday;
	}
	public float getMonthHoliday() {
		return monthHoliday;
	}
	public void setMonthHoliday(float monthHoliday) {
		this.monthHoliday = monthHoliday;
	}
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
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}
	public int getDptNo() {
		return dptNo;
	}
	public void setDptNo(int dptNo) {
		this.dptNo = dptNo;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getUseyn() {
		return useyn;
	}
	public void setUseyn(int useyn) {
		this.useyn = useyn;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getLikedDpr() {
		return likedDpr;
	}
	public void setLikedDpr(String likedDpr) {
		this.likedDpr = likedDpr;
	}
	public String getLikedDest() {
		return likedDest;
	}
	public void setLikedDest(String likedDest) {
		this.likedDest = likedDest;
	}
	public int getHoliday() {
		return holiday;
	}
	public void setHoliday(int holiday) {
		this.holiday = holiday;
	}
	
	
	
	/*
	
	@Override
	public String toString() {
		return "UserVO [Id=" + Id + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberNm=" + memberNm
				+ ", dptNo=" + dptNo + ", grade=" + grade + ", useyn=" + useyn + ", createDate=" + createDate
				+ ", likedDpr=" + likedDpr + ", likedDest=" + likedDest + ", holiday=" + holiday + ", monthHoliday="
				+ monthHoliday + ", alterHoliday=" + alterHoliday + "]";
	}
	
	*/
	
	
	//================================================================= 2021.03.10
				 
				
			
				 
				

	private int dutyId;
	private String workingDate;
	private String holidayDate;
	
	
	
	public int getDutyId() {
		return dutyId;
	}
	public void setDutyId(int DutyId) {
		this.dutyId = dutyId;
	}
	
	
	public String getWorkingDate() {
		return workingDate;
	}
	public void setWorkingDate(String workingDate) {
		this.workingDate = workingDate;
	}
	
	public String getHolidayDate() {
		return holidayDate;
	}
	public void setHolidayDate(String holidayDate) {
		this.holidayDate = holidayDate;
	}
	


	@Override
	public String toString() {
		return "UserVO [Id=" + Id + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberNm=" + memberNm
				+ ", dptNo=" + dptNo + ", grade=" + grade + ", useyn=" + useyn + ", createDate=" + createDate
				+ ", likedDpr=" + likedDpr + ", likedDest=" + likedDest + ", holiday=" + holiday + ", monthHoliday="
				+ monthHoliday + ", alterHoliday=" + alterHoliday + ", dutyId=" + dutyId + ", workingDate=" + workingDate
				+ ", holidayDate=" + holidayDate + "]";
	}
	
	
	
	
	//=================================================================	
	
	
}
