function viewCommonList(memberList, year, month, lastDay, week, weekend) {
    //공통열 추가 
    var schedule ='<tr class="scheduleTr" ><td class="w3-border w3-center w3-sand">공통</td>';
    for(var j=0;j<lastDay;j++){
  	     schedule +='<td class="w3-sand w3-border w3-text-red" id="commonId'+year+month+(j+1)+
  	     '"<td style="text-align:center"></td>'
    }
    schedule += '</tr>';
    
    for(var i=0;i<memberList.length;i++){
      schedule += '<tr class="scheduleTr" id="trid'+memberList[i].memberId+'" ><td class="w3-border w3-center">'+memberList[i].memberNm+'</td>';
      for(var j=0;j<lastDay;j++){
    	  //토요일 일요일마다 회색 음영
    	  var clickSid = memberList[i].memberId+year+month+(j+1);
    	  if(week[(weekend+j)%7]=='토'||week[(weekend+j)%7]=='일'){  
    	     schedule +='<td class="w3-light-grey w3-border " onclick="dayClick('+clickSid+')" id="sdid'+
    	     clickSid+'"></td>'
    	  }else{
    	     schedule +='<td class="w3-border" onclick="dayClick('+clickSid+')" style="text-align:center" id="sdid'+
    	     clickSid+'"></td>'
    	  }
      }
      schedule += '</tr>'  
    }
    $('#yoil').after(schedule);
}