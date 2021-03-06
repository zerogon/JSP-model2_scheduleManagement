<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w3-modal-content w3-light-grey w3-card-4" style="max-width: 700px;">
        <div class="w3-container w3-center w3-teal" style="height:38px">
            <div style="margin-top:2px"><font size=5>상 세 보 기</font></div>
        </div>
        <div class="w3-container w3-padding" >
        <span onclick="exitDoit()" class="w3-button w3-display-topright">&times;</span>
                <div class="w3-row w3-padding">
                	<button class="w3-button w3-black w3-right" onclick="exitDoit()" style="margin-top:-5px;">닫기</button>
               	  <c:if test="${userVO.grade==3}">
                	<button class="w3-button w3-red w3-right" onclick="boardDelete(${boardVO.id})" style="margin-top:-5px;margin-right:10px">삭제</button>
         		   </c:if>
                	
                	<br><br>
                <!--  update,delete end-->	
                   <table class="w3-table-all">
                    <tr>
                      <td style="width:15%" class="w3-sand w3-center">제 목 :</td>
                      <td> ${boardVO.title }</td>
                    </tr>
                    <tr>
                      <td class="w3-sand w3-center">작 성 자 : </td>
                      <td> ${boardVO.memberNm }</td>
                    </tr>
                    <tr>
                      <td class="w3-sand w3-center">작 성 일 : </td>
                      <td> ${boardVO.formatDate }</td>
                    </tr>
                    <tr>
                      <td class="w3-sand w3-center" style="padding-top:70px;padding-bottom: 70px">내 용 : </td>
                      <td>${boardVO.content }</tr>
                   
                  </table>
                  <!--  댓글 영역, ajax로 load-->
                </div>
        </div>
    </div>
    
    <script>
	function exitDoit(){
		document.getElementById('borderDetail').style.display='none';
	}
	
	function boardDelete(boardId){
		if(confirm("정말로 삭제하시겠습니까?")){
			var boardPageNum = '<c:out value="${boardPageNum}"/>'
			document.getElementById('borderDetail').style.display='none';
			$.ajax({
				 url : "${ pageContext.servletContext.contextPath }/page/board/boardAllDelete", 
		    	 method : "GET",  
		    	 dataType:"text",
		    	 data:{ 
		    			"bid":boardId,
		    			"bpnum":boardPageNum,
		    			}, 
	              success: function(data){
	            	  $('#boardList').html(data);
					},
			error: function(request, status, error) {
				alert(error);
			}
			});	
		}	
	}
    </script>