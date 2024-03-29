<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<div class="w3-main" style="overflow: scroll; height: auto; margin-top:50px;">
    <div class="w3-border w3-light-grey " style="width: 1405px;">
        <div class=" w3-border w3-border-black w3-center w3-teal" style="height:38px">
            <div>
            <button class="w3-button w3-hover-white" style="padding:5px"
            onclick = "teamChangeWeek('pre')"
            > ◀ </button>
            <a class="w3-button w3-hover-white" style="padding:1px;font-size: 23px"
            href='${ pageContext.servletContext.contextPath }/page/teamSchedule'> ${currentYear } 년 ${currentMonth } 월 </a>
            <font size=4 color='black'> -${currentWeek } 주차-</font>
            <button class="w3-button w3-hover-white" style="padding:5px"
            onclick = "teamChangeWeek('nxt')"
            > ▶ </button>
            </div>
        </div> 
     
        <div style="float:left;width:200px" class="w3-border  w3-gray w3-center">
            <div id ="week${week1 }"><font>일(${week1 }) </font></div>
            <div id="weekD${week1 }" class="w3-white w3- w3-padding">
             <span class="w3-small">&nbsp;</span><br>
             <span class="w3-small">근무 : ${weekVO1.work } </span><br>
             <span class="w3-small">점검 :  ${weekVO1.monitor }</span><br>
             <span class="w3-small">&nbsp;</span><br>
             <span class="w3-small">&nbsp;</span><br>
            </div>
              <c:if test="${not empty weekVO1.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		주말당직
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO1.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
              <c:if test="${not empty weekVO1.members[1]}">
            	<div class="w3-sand w3-border w3-border-black">
             		점검
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO1.members[1]}">
			                 <span class="w3-small"> 
			                 ${member.memberNm}</span><br>
						
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            
           	<c:if test= "${week1 eq currentDay}">	
            <c:if test="${not empty weekVO1.members[1]}">
	             <c:forEach var="member" items="${weekVO1.members[1]}">
	             	<c:if test="${member.memberNm eq userVO.memberNm}">
	              		<script>
	              		swal({
            				title : "알림",
            				text : "일요일 점검 일정이 있습니다.",
            				icon : "info"
            			})	            		
            			</script>
	             	</c:if>   
					</c:forEach>
	        </c:if> 
            </c:if>
        </div>
        <div style="float:left;width:200px" class="w3-border w3-light-gray w3-center">
            <div id="week${week2 }"><font>월(${week2 }) </font></div>
         	<c:if test="${jungCnt1 == 0}">
	         	<div id="weekD${week2 }" class="w3-white w3-padding">
		             <span class="w3-small">휴무 <font color="grey">(반차포함)</font> : ${weekVO2.humu }</span><br>
		             <span class="w3-small">휴가 <font color="grey">(Refresh + 하계)</font> : ${weekVO2.huga }</span><br>
		             <span class="w3-small">교육 : ${weekVO2.education }</span><br>
		             <span class="w3-small">재택근무 : ${weekVO2.homework }</span><br>
		             <span class="w3-small">출장 : ${weekVO2.chul }</span><br>  
	            </div>

	             
	             <c:if test="${not empty weekVO2.members[0]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		연차/대휴/공가/보상
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO2.members[0]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO2.members[1]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		반차
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO2.members[1]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO2.members[2]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		휴가<font color="grey">(Refresh+하계)</font>
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO2.members[2]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO2.members[3]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		교육 및 세미나
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO2.members[3]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <!-- 재택 -->
	            <c:if test="${not empty weekVO2.members[5]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		재택근무
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO2.members[5]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO2.members[4]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		출장
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO2.members[4]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
         	</c:if>
         	<c:if test="${jungCnt1 > 0}">
         		<div id="weekD${week2 }" class="w3-white w3-padding">
	             <span class="w3-small">&nbsp;</span><br>
	             <span class="w3-small"><font color="red"> - 휴 무 - </font></span><br>
	             <span class="w3-small">근무 : ${weekVO2.work } </span><br>
	             <span class="w3-small">점검 : ${weekVO2.monitor }</span><br>
	             <span class="w3-small">&nbsp;</span><br>
                </div>
                <c:if test="${not empty weekVO2.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		당 직
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO2.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
           		 </c:if>
           		 <!-- 당직 점검 추가 -->
           		 <c:if test="${not empty weekVO2.members[1]}">
            	 <div class="w3-sand w3-border w3-border-black">
             		점검
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO2.members[1]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	             </div>
          		  </c:if>
         	</c:if>
             
            <c:if test= "${week2 eq currentDay}">
               <c:if test="${not empty weekVO2.members[6]}">
	             <c:forEach var="member" items="${weekVO2.members[6]}">
	             	<c:if test="${member.memberNm eq userVO.memberNm}">
	              		<script>
		              		swal({
        	    				title : "알림",
            					text : "월요일 점검 일정이 있습니다.",
            					icon : "info"
            				})	            		
            			</script>
	             	</c:if>   
				 </c:forEach>
				 </c:if>
	            </c:if> 
          
             
        </div>
        <div style="float:left;width:200px" class="w3-border w3-light-gray w3-center">
            <div id="week${week3 }"><font>화(${week3 }) </font></div>
            <c:if test="${jungCnt2 == 0}">
             <div id="weekD${week3 }" class="w3-white w3- w3-padding">
	             <span class="w3-small">휴무 <font color="grey">(반차포함)</font> : ${weekVO3.humu }</span><br>
	             <span class="w3-small">휴가 <font color="grey">(Refresh + 하계)</font> : ${weekVO3.huga }</span><br>
	             <span class="w3-small">교육 : ${weekVO3.education }</span><br>
	             <span class="w3-small">재택근무 : ${weekVO3.homework }</span><br>
	             <span class="w3-small">출장 : ${weekVO3.chul }</span><br>
            </div>
            <!-- 유저 List start -->
            <c:if test="${not empty weekVO3.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		연차/대휴/공가/보상
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO3.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO3.members[1]}">
            	<div class="w3-sand w3-border w3-border-black">
             		반차
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO3.members[1]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO3.members[2]}">
            	<div class="w3-sand w3-border w3-border-black">
             		휴가<font color="grey">(Refresh+하계)</font>
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO3.members[2]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO3.members[3]}">
            	<div class="w3-sand w3-border w3-border-black">
             		교육 및 세미나
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO3.members[3]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <!-- 재택 -->
            <c:if test="${not empty weekVO3.members[5]}">
            	<div class="w3-sand w3-border w3-border-black">
             		재택근무
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO3.members[5]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO3.members[4]}">
            	<div class="w3-sand w3-border w3-border-black">
             		출장
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO3.members[4]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            </c:if>
            <!-- user 리스트 end -->
            <c:if test="${jungCnt2 > 0}">
         		<div id="weekD${week3 }" class="w3-white w3-padding">
	             <span class="w3-small">&nbsp;</span><br>
	             <span class="w3-small"><font color="red"> - 휴 무 - </font></span><br>
	             <span class="w3-small">근무 : ${weekVO3.work } </span><br>
	             <span class="w3-small">점검 : ${weekVO3.monitor }</span><br>
	             <span class="w3-small">&nbsp;</span><br>
                </div>
                <c:if test="${not empty weekVO3.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		당 직
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO3.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
           		 </c:if>
           		 <!-- 당직 점검 추가 -->
           		 <c:if test="${not empty weekVO3.members[1]}">
            	 <div class="w3-sand w3-border w3-border-black">
             		점검
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO3.members[1]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	             </div>
          		  </c:if>
         	</c:if>
         	<c:if test= "${week3 eq currentDay}">	
         	<c:if test="${not empty weekVO3.members[6]}">
	             <c:forEach var="member" items="${weekVO3.members[6]}">
	             	<c:if test="${member.memberNm eq userVO.memberNm}">
	              		<script>
	              		swal({
            				title : "알림",
            				text : "화요일 점검 일정이 있습니다.",
            				icon : "info"
            			})	            		</script>
	             	</c:if>   
					</c:forEach>
	        </c:if> 
         	</c:if>
         	
         	
         	
        </div>
        <div style="float:left;width:200px" class="w3-border w3-light-gray w3-center">
            <div id="week${week4 }"><font>수(${week4 }) </font></div>
            <c:if test="${jungCnt3 == 0}">
	            <div id="weekD${week4 }"class="w3-white w3- w3-padding">
		             <span class="w3-small">휴무 <font color="grey">(반차포함)</font> : ${weekVO4.humu }</span><br>
		             <span class="w3-small">휴가 <font color="grey">(Refresh + 하계)</font> : ${weekVO4.huga }</span><br>
		             <span class="w3-small">교육 : ${weekVO4.education }</span><br>
		             <span class="w3-small">재택근무 : ${weekVO4.homework }</span><br>
		             <span class="w3-small">출장 : ${weekVO4.chul }</span><br>
	            </div>
	             <c:if test="${not empty weekVO4.members[0]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		연차/대휴/공가/보상
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO4.members[0]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO4.members[1]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		반차
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO4.members[1]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO4.members[2]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		휴가<font color="grey">(Refresh+하계)</font>
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO4.members[2]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO4.members[3]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		교육 및 세미나
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO4.members[3]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <!-- 재택 -->
	            <c:if test="${not empty weekVO4.members[5]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		재택근무
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO4.members[5]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO4.members[4]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		출장
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO4.members[4]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
            </c:if>
            <c:if test="${jungCnt3 > 0}">
         		<div id="weekD${week4 }" class="w3-white w3-padding">
	             <span class="w3-small">&nbsp;</span><br>
	             <span class="w3-small"><font color="red"> - 휴 무 - </font></span><br>
	             <span class="w3-small">근무 : ${weekVO4.work } </span><br>
	             <span class="w3-small">점검 : ${weekVO4.monitor }</span><br>
	             <span class="w3-small">&nbsp;</span><br>
                </div>
                <c:if test="${not empty weekVO4.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		당 직
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO4.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
           		 </c:if>
           		 <!-- 당직 점검 추가 -->
           		 <c:if test="${not empty weekVO4.members[1]}">
            	 <div class="w3-sand w3-border w3-border-black">
             		점검
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO4.members[1]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	             </div>
          		  </c:if>
         	</c:if>
         	
         	<c:if test= "${week4 eq currentDay}">	
         	<c:if test="${not empty weekVO4.members[6]}">
	             <c:forEach var="member" items="${weekVO4.members[6]}">
	             	<c:if test="${member.memberNm eq userVO.memberNm}">
	              		<script>
	            			swal({
	            				title : "알림",
	            				text : "수요일 점검 일정이 있습니다.",
	            				icon : "info"
	            			})
	            		</script>
	             	</c:if>   
					</c:forEach>
	        </c:if> 
         	</c:if> 
         	
        </div>
        <div style="float:left;width:200px" class="w3-border w3-light-gray w3-center">
            <div id="week${week5 }" ><font >목(${week5 }) </font></div>
            <c:if test="${jungCnt4 == 0}">
	            <div id="weekD${week5 }" class="w3-white w3- w3-padding">
		             <span class="w3-small">휴무 <font color="grey">(반차포함)</font> : ${weekVO5.humu }</span><br>
		             <span class="w3-small">휴가 <font color="grey">(Refresh + 하계)</font> : ${weekVO5.huga }</span><br>
		             <span class="w3-small">교육 : ${weekVO5.education }</span><br>
		             <span class="w3-small">재택근무 : ${weekVO5.homework }</span><br>
		             <span class="w3-small">출장 : ${weekVO5.chul }</span><br>
	            </div>
	             <c:if test="${not empty weekVO5.members[0]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		연차/대휴/공가/보상
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO5.members[0]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO5.members[1]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		반차
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO5.members[1]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO5.members[2]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		휴가<font color="grey">(Refresh+하계)</font>
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO5.members[2]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO5.members[3]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		교육 및 세미나
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO5.members[3]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <!-- 재택 -->
	            <c:if test="${not empty weekVO5.members[5]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		재택근무
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO5.members[5]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty weekVO5.members[4]}">
	            	<div class="w3-sand w3-border w3-border-black">
	             		출장
		                <div class="w3-white w3-padding">
				          	 <c:forEach var="member" items="${weekVO5.members[4]}">
				                 <span class="w3-small"> ${member.memberNm}</span><br>
				          	 </c:forEach>
		                </div>
		            </div>
	            </c:if>
            </c:if>
            <c:if test="${jungCnt4 > 0}">
         		<div id="weekD${week5 }" class="w3-white w3-padding">
	             <span class="w3-small">&nbsp;</span><br>
	             <span class="w3-small"><font color="red"> - 휴 무 - </font></span><br>
	             <span class="w3-small">근무 : ${weekVO5.work } </span><br>
	             <span class="w3-small">점검 : ${weekVO5.monitor }</span><br>
	             <span class="w3-small">&nbsp;</span><br>
                </div>
                <c:if test="${not empty weekVO5.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		당 직
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO5.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
           		 </c:if>
           		 <!-- 당직 점검 추가 -->
           		 <c:if test="${not empty weekVO5.members[1]}">
            	 <div class="w3-sand w3-border w3-border-black">
             		점검
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO5.members[1]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	             </div>
          		  </c:if> 		  
         	</c:if>
         	
         	<c:if test= "${week5 eq currentDay}">	
         	
         	<c:if test="${not empty weekVO5.members[6]}">
	             <c:forEach var="member" items="${weekVO5.members[6]}">
	             	<c:if test="${member.memberNm eq userVO.memberNm}">
	              		<script>
	              		swal({
            				title : "알림",
            				text : "목요일 점검 일정이 있습니다.",
            				icon : "info"
            			})	            		</script>
	             	</c:if>   
					</c:forEach>
	        </c:if> 
	        </c:if> 
	        
        </div>
        <div style="float:left;width:200px" class="w3-border w3-light-gray w3-center">
            <div id="week${week6 }" ><font>금(${week6 }) </font></div>
            <c:if test="${jungCnt5 == 0}">
            <div id="weekD${week6 }" class="w3-white w3- w3-padding">
	             <span class="w3-small">휴무 <font color="grey">(반차포함)</font> : ${weekVO6.humu }</span><br>
	             <span class="w3-small">휴가 <font color="grey">(Refresh + 하계)</font> : ${weekVO6.huga }</span><br>
	             <span class="w3-small">교육 : ${weekVO6.education }</span><br>
	             <span class="w3-small">재택근무 : ${weekVO6.homework }</span><br>
	             <span class="w3-small">출장 : ${weekVO6.chul }</span><br>
            </div>
             <c:if test="${not empty weekVO6.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		연차/대휴/공가/보상
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO6.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO6.members[1]}">
            	<div class="w3-sand w3-border w3-border-black">
             		반차
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO6.members[1]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO6.members[2]}">
            	<div class="w3-sand w3-border w3-border-black">
             		휴가<font color="grey">(Refresh+하계)</font>
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO6.members[2]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO6.members[3]}">
            	<div class="w3-sand w3-border w3-border-black">
             		교육 및 세미나
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO6.members[3]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO6.members[5]}">
            	<div class="w3-sand w3-border w3-border-black">
             		재택근무
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO6.members[5]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO6.members[4]}">
            	<div class="w3-sand w3-border w3-border-black">
             		출장
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO6.members[4]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            </c:if>
            <c:if test="${jungCnt5 > 0}">
         		<div id="weekD${week6 }" class="w3-white w3-padding">
	             <span class="w3-small">&nbsp;</span><br>
	             <span class="w3-small"><font color="red"> - 휴 무 - </font></span><br>
	             <span class="w3-small">근무 : ${weekVO6.work } </span><br>
	             <span class="w3-small">점검 : ${weekVO6.monitor }</span><br>
	             <span class="w3-small">&nbsp;</span><br>
                </div>
                <c:if test="${not empty weekVO6.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		당 직
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO6.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
           		 </c:if>
           		 <!-- 당직 점검 추가 -->
           		 <c:if test="${not empty weekVO6.members[1]}">
            	 <div class="w3-sand w3-border w3-border-black">
             		점검
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO6.members[1]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	             </div>
          		  </c:if>
         	</c:if>
         	<c:if test= "${week6 eq currentDay}">         	
         	<c:if test="${not empty weekVO6.members[6]}">
	             <c:forEach var="member" items="${weekVO6.members[6]}">
	             	<c:if test="${member.memberNm eq userVO.memberNm}">
	              		<script>
	              		swal({
            				title : "알림",
            				text : "금요일 점검 일정이 있습니다.",
            				icon : "info"
            			})	            		</script>
	             	</c:if>   
					</c:forEach>
	        </c:if> 
         	</c:if>
        </div>
        <div style="float:left;width:200px" class="w3-border w3-gray w3-center">
            <div id="week${week7 }"><font>토(${week7 }) </font></div>
            <div id="weekD${week7 }" class="w3-white w3- w3-padding">
	             <span class="w3-small">&nbsp;</span><br>
	             <span class="w3-small">근무 :  ${weekVO7.work }</span><br>
	             <span class="w3-small">점검 :  ${weekVO7.monitor }</span><br>
	             <span class="w3-small">&nbsp;</span><br>
	             <span class="w3-small">&nbsp;</span><br>
            </div>
            <c:if test="${not empty weekVO7.members[0]}">
            	<div class="w3-sand w3-border w3-border-black">
             		주말당직
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO7.members[0]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
            <c:if test="${not empty weekVO7.members[1]}">
            	<div class="w3-sand w3-border w3-border-black">
             		점검
	                <div class="w3-white w3-padding">
			          	 <c:forEach var="member" items="${weekVO7.members[1]}">
			                 <span class="w3-small"> ${member.memberNm}</span><br>
			          	 </c:forEach>
	                </div>
	            </div>
            </c:if>
       	<c:if test= "${week7 eq currentDay}">	
            
            <c:if test="${not empty weekVO7.members[1]}">
	             <c:forEach var="member" items="${weekVO7.members[1]}">
	             	<c:if test="${member.memberNm eq userVO.memberNm}">
	              		<script>
	              		swal({
            				title : "알림",
            				text : "토요일 점검 일정이 있습니다.",
            				icon : "info"
            			})	            		</script>
	             	</c:if>   
					</c:forEach>
	        </c:if> 
            </c:if>
        </div>
    </div>
</div>
  <script>


	//공지사항 쓰기폼 모달
	function boardWriteForm() {
		document.getElementById('borderReg').style.display = 'block';
	}
	function boardDetail(boardId,pageNum) {
		document.getElementById('borderDetail').style.display = 'block';
		$('#borderDetail').load('${ pageContext.servletContext.contextPath }/page/board/boardAllContent?bid='+boardId+'&pnum='+pageNum)
	}
	$('#borderDetail').draggable();
	
	function boardReg(){
		event.preventDefault();
		var memberId = '<c:out value="${userVO.id }"/>'
	    var memberNm = '<c:out value="${userVO.memberNm }"/>'
		var content = $('#boardArea').val();
		var title = $('#boardTitle').val();
		if(title==""){
			alert("제목을 입력해주세요.");
		}else{
		    $('#commitbtn_b, #cancelbtn_b, #xbutton_b').attr('disabled',true); 
		    $('#commitbtn_b').html('<i class="fa fa-spinner fa-spin" style="font-size:16px;padding:3px" ></i>');
		 	document.getElementById('borderReg').style.display = 'none';
			$.ajax({
				 url : "${ pageContext.servletContext.contextPath }/page/board/boardAllReg", 
		    	 method : "GET",  
		    	 dataType:"text",
		    	 data:{
		    			"title":title,
		    			"memberId":memberId,
		    			"memberNm":memberNm,
		    			"content":content,
		    			}, 
	              success: function(data){
	            	  $('#boardList').html(data);
	            	  $('#commitbtn_b, #cancelbtn_b, #xbutton_b').attr('disabled',false); 
	            	  $('#commitbtn_b').html('등록');
	      		 	
				}, 
			error: function(request, status, error) {
				alert(error);
			}
			});
		}
	}
	function teamChangeWeek(action) {
    	var sendDate = '${currentYear }${currentMonth}${currentDay}'
		location.href='${ pageContext.servletContext.contextPath }/page/teamSchedule?sdate='+sendDate+'&action='+action;			
	}
	
	
	
	
	<!-----------------------------------------< 색상 변경 >----------------------------------------------------------------------------->
	
    $(document).ready(function(){
    	//오늘 날짜에 해당하는 영역 주황색 음영
		var today = new Date();
	    var todayDate = today.getDate();
	    todayDate = todayDate < 10 ? todayDate = '0'+(todayDate).toString() : todayDate ; 
		$('#week'+todayDate).attr({
			'style':'background-color:#9DC3C1'
		});
		$('#weekD'+todayDate).attr({
			'style':'background-color:#D8E6E7;', 'class' :'w3-padding'
		});
		$('#week'+todayDate).append("<i class='fa fa-calendar-check-o'></i>");
		
		//공지사항 로드
		$('#boardList').load('${ pageContext.servletContext.contextPath }/page/board/boardAllList');
		
	});
	
	
  </script>
