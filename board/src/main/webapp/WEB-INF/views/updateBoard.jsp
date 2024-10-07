<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 화면</title>
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
			
        	var board_title = $("#board_title");
			if (board_title.val() == "") {
				alert("제목을 입력해주세요.");
				board_title.focus();
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
	<h3>수정화면</h3>
	<form action="${contextPath }/updateBoard" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_id" id="board_id" value="${boardDto.board_id}">
		<table>
			<tr>
				<th>회사</th>
					<td>
						<div>
							${boardDto.board_company }
						</div>		
					</td>
				<th>등록일자</th>
					<td>
						<fmt:formatDate value="${boardDto.board_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
					</td>
				<th>등록자</th>
					<td>
						${boardDto.board_register }
					</td>
			</tr>
			
			<tr>
				<th>제목</th>
					<td colspan="3">
				<input type="text" name="board_title" id="board_title" style="width:90%" placeholder="${boardDto.board_title }" maxlength="100">
			</td>
			</tr>
			
		</table>
		
		<table>
			<tr>
				<th align="left">내용</th>
			</tr>
			<tr>
				<td>
					<textarea name="board_contents" id="board_contents" rows="30" cols="145" placeholder="${boardDto.board_contents }" maxlength="1000" style="width:90%; hegiht: 75%;"></textarea>
					<div class="text_length" align="right">0 / 1000</div>
				</td>
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