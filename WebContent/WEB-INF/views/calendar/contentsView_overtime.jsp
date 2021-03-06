<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w3-modal-content w3-light-grey w3-card-4"
	style="max-width: 650px;">
	<div class="w3-container w3-center w3-teal" style="height: 38px">
	<div style="margin-top:4px">
	<font size=5>야근식대 사용내역</font>
	</div>
	</div>
	<div class="w3-container">
		<span
			onclick="document.getElementById('message').style.display='none';location.reload();"
			class="w3-button w3-display-topright">&times;</span>
			<div style="padding:5px">
			<font size="3" color="grey"> * 등록한 내용은 드래그시 다른날짜로 이동가능합니다.</font>
			</div>
			
		<div class="calendarForm w3-center  w3-container w3-padding"
			id="modal" style="width:620px">
			<form id="userinput">
				<table class="w3-table w3-bordered">
					<tr>
						<td><font color="grey">등록자 :</font></td>
						<td class ="w3-large">${overtimeVO.memberNm}</td>
						<td><font color="grey">사용일 :</font></td>
						<td class ="w3-large">${overtimeVO.useDate}</td>
					</tr>
					<tr>
						<td><font color="grey">음식점 :</font></td>
					 	<td class ="w3-large">${overtimeVO.shopName}</td> 
						<td><font color="grey">내용 :</font></td>
					 	<td class ="w3-large">${overtimeVO.content}</td> 
					</tr>
					<tr>
						<td><font color="grey">금액 :</font></td>
						<td class ="w3-large">${overtimeVO.price} 원</td>
						<td><font color="grey">카드소지자 :</font></td>
						<td class ="w3-large">${overtimeVO.cardHolder}</td>
					</tr>
				</table>
				<div class="w3-padding">
					<font color="grey" size="4">[동행인]</font>
				</div>
				<div> 
					<c:forEach var="overtime" items="${overtimesLi}">
						<button onclick="event.preventDefault()"
						class="w3-button w3-black w3-hover-black w3-span w3-border w3-border-white" 
						style="padding:5px">${overtime.targetMbrNm }</button>
					</c:forEach>
				</div>
				<div class="w3-margin">
				<button class="w3-button w3-border " onclick="toUpdatePageForCal('o${overtimeVO.id}');">수정</button>
				<input type="reset" class="w3-button w3-red "
					onclick="deleteCardForCal('o${overtimeVO.id}');" value="삭제">
				<button id="cancelbtn" onclick="document.getElementById('message').style.display='none';event.preventDefault();location.reload();"
               class="w3-button w3-border">취소</button>		
					
				</div>
			</form>
		</div>
	</div>
</div>
