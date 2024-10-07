<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="now" value="<%= new java.util.Date() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 화면</title>
<style>
        table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: center;
			height: 40px;
        }
        .query-label {
            width: 100px;
        }
        .button {
        	text-align: right;
        	margin-top: 15px;
        }
        textarea{
        	resize: none;
        }
</style>
<script src="${contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script>
	
    $(document).ready(function () {
    	
        $('#board_contents').keyup(function (e) {
            var content = $(this).val();
            
            $('.text_length').text(content.length + " / 1000");
            
            if (content.length == 1000) {
                $(this).val(content.substring(0, 1000));
                alert('글자수는 1000자까지 입력 가능합니다.');
            }
        });
    	
        $("form").submit(function () {
        	
        	var board_company = $("#board_company");
			if (board_company.val() == "default" || board_company.val() == "") {
				alert("회사를 골라주세요.");
				board_company.focus();
				return false;
			}
			
        	var board_title = $("#board_title");
			if (board_title.val() == "") {
				alert("제목을 입력해주세요.");
				board_title.focus();
				return false;
			}
			
			var board_register = $("#board_register");
			if (board_register.val() == "") {
				alert("등록자를 입력해주세요.");
				board_register.focus();
				return false;
			}
			
			var board_password = $("#board_password");
			if (board_password.val() == "") {
				alert("비밀번호를 입력해주세요.");
				board_password.focus();
				return false;
			}
			
			var board_contents = $("#board_contents");
			if (board_contents.val() == "") {
				alert("내용을 입력해주세요.");
				board_contents.focus();
				return false;
			}
        	
        	
        });
    });
</script>



</head>
<body>
	<h3>등록화면</h3>
	<form action="${contextPath }/register" method="post" enctype="multipart/form-data">
		<table>
		<tr>
			<th>회사</th>
			<td>
				<select name="board_company" id="board_company">
					<option value="default">선택</option>
					<option value="company1">회사1</option>
					<option value="company2">회사2</option>
					<option value="company3">회사3</option>
					<option value="company4">회사4</option>
					<option value="company5">회사5</option>
				</select>
			</td>
			<th>등록일자</th>
			<td>
				<fmt:formatDate value="${now }" pattern="yyyy-MM-dd"></fmt:formatDate>
			</td>
			<th>등록자</th>
			<td>
				<input type="text" name="board_register" id="board_register">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">
				<input type="text" name="board_title" id="board_title" style="width:90%" maxlength="100">
			</td>
			<th>비밀번호</th>
			<td>
				<input type="text" name="board_password" id="board_password" >
			</td>
		</tr>
		</table>
		<table border="1">
			<tr>
				<th align="left">내용</th>
			</tr>
			<tr>
				<td>
					<textarea name="board_contents" id="board_contents" rows="30" maxlength="1000" style="width:90%; hegiht: 75%;"></textarea>
					<div class="text_length" align="right">0 / 1000</div>
				</td>
			</tr>
		</table>
		<div class="button">
			<button type="submit">저장</button>
			<a href="${contextPath }/">
            	<button type="button" onclick="window.location.href='${contextPath }/'">닫기</button>
        	</a>
		</div>
	</form>
</body>
</html>