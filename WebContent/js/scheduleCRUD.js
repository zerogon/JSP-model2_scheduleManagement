var ctx = sessionStorage.getItem("contextpath");

function fromServer() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			document.getElementById("messageContent").innerHTML =  httpRequest.responseText ;
		}
	}
}
function fromServerForUpdate() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			document.getElementById("messageContent").innerHTML =  httpRequest.responseText ;
			function datePicker_u(){
				//jQuery datepicker 기본설정
				$.datepicker.setDefaults({
					dateFormat: 'yy-mm-dd' //Input Display Format 변경
						,showOtherMonths: false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
						,stepMonths: 1 // 월 넘어가는 수 
						,changeYear: false //콤보박스에서 년 선택 가능
						,changeMonth: false //콤보박스에서 월 선택 가능                
						,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
							,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
								,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
				,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
				,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
				,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
				});
				$("#startdate_u").datepicker();
				$("#enddate_u").datepicker();
			}
			datePicker_u();
		}
	}
}

function contentView(data) {
	var id = "id=" + data;
	sendRequest(ctx + "/page/contentsView", id, fromServer, "POST");
}
function contentView_admin(data) {
	var id = "id=" + data;
	sendRequest(ctx + "/page/contentsViewAdm", id, fromServer, "POST");
}
function deleteSchedule(data) {
	var id = "id=" + data;
	sendRequest(ctx + "/page/deleteSchedule", id, fromServer, "POST");
}
function deleteSchedule_admin(data, grade, dptNo) {
	//요일이 id 값, 시작일 기준으로 일정있으면 삭제.
	/*
	 0: 일반
	1: 관리자
	2: 파트장
	3: 슈퍼관리자
	 */
	var id = null;
	if(grade == 3){
		id = "id=" + data;
		if(confirm("!!!!확인 시 해당일, 전체 사용자 일정이 삭제됩니다.!!!!!")){
			sendRequest(ctx + "/page/deleteScheduleAdm", id, fromServer, "POST");
		}
	}else if(grade == 2 || grade == 1){
		id = "id=" + data + "&dptNo=" + dptNo;
		if(confirm("!!!!확인 시 해당일, 파트전체 일정이 삭제됩니다.!!!!!")){
			sendRequest(ctx + "/page/deleteSchedulePT", id, fromServer, "POST");
		}
	}
	
}
function addSchedule(data) {
	sendRequest(ctx + "/page/addSchedule", data, fromServer, "POST");
}

function update(data) {
	sendRequest(ctx + "/page/updatePro", data, fromServer, "POST");
}



//===========================================================2021.03.19



function updateInclueDuty(data) {
	
	
	var data = data + "&Add="+ "No";
	
	
	sendRequest(ctx + "/page/updateProDuty", data, fromServer, "POST");
}



function updateInclueDuty_Add(data) {
	
	var data1 = data + "&Add="+ "Add";
	
	sendRequest(ctx + "/page/updateProDuty", data1, fromServer, "POST");
}


//============================================================


function toUpdatePage(data) {
	
	var data1 = "id=" + data;
	sendRequest(ctx + "/page/updateForm", data1, fromServerForUpdate, "POST");
	event.preventDefault();
}



function toUpdateAddPage(data) {
	
	var data1 = "id=" + data + "&Add" + data;
	sendRequest(ctx + "/page/updateForm", data1, fromServerForUpdate, "POST");
	event.preventDefault();
}


