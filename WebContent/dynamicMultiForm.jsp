<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dynamicMultiForm.jsp 페이지</title>
<script>
   var count = 1;  // 함수 밖에서 선언 했기 때문에 '전역변수'
   
   function addRow() {
      var dynamicTable = document.getElementById('dynamic_table');  // getElementById는 상호작용 위해서 사용
      var newRow = dynamicTable.insertRow();   //tr
      var cell1 = newRow.insertCell();          //td
      var cell2 = newRow.insertCell();
      
      cell1.innerHTML = '<input type="checkbox" name="checkboxObj"/>';
      cell2.innerHTML = '<input type="file" name="fileUpload'+count+'" size="70" onchange="checkSize(this)"/>';
      count++;
   }
   function checkSize(input) {
      if(input.files && input.files[0].size > (20 * 1024 * 1024)) {
         window.alert("파일 사이즈가 20MB를 넘습니다!!")
         input.value = null;
      }
   }
   function deleteRow() {
	   var table = document.getElementById('dynamic_table');
	   var checkboxArray = document.getElementsByName('checkboxObj'); 
	   
	   for(var i= checkboxArray.length-1; i>=0; i--){
		   var check = checkboxArray[i].checked; //check 변수는 boolean 변수이다.
		   
		   if(check){
			   table.deleteRow(i);
		   }
	   }
   }
   
</script>
</head>
<body>
   <h2>동적 다중 파일 업로드 하기</h2>
   <form name="dynamicForm" method="POST"
        enctype="multipart/form-data" action="register.jsp">
      <table border="1" cellpadding="0" cellspacing="0">
         <tr>
            <td>작성자</td>
            <td><input type="text" name="name"/></td>
         </tr>
         <tr>
            <td>제  목</td>
            <td><input type="text" name="subject"/></td>
         </tr>
      </table>
      <br>
      <input type="button" value="행추가" onClick="addRow();"/>&nbsp;&nbsp;&nbsp;
      <input type="button" value="행삭제" onClick="deleteRow();"/>
      <br><br>
      Check &nbsp;&nbsp;&nbsp;&nbsp; 업로드할 파일 이름
      <table id="dynamic_table"
            border="1" cellpadding="0" cellspacing="0"></table>
         <h4><font color="red">업로드할 파일은 최대 20MB 까지 업로드 가능합니다!!</font></h4>
         <input type="submit" value="파일 올리기"/>
   </form>
</body>
</html>