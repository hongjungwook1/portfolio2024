<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회 화면</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
</style>
<script>
    $(document).ready(function() {
    	
        $("#startDate, #endDate").datepicker({
            dateFormat: "yy-mm-dd"
        });

        var today = new Date();
        var lastMonth = new Date();
        lastMonth.setMonth(today.getMonth() - 1);

        var formatDate = function(date) {
            var year = date.getFullYear();
            var month = String(date.getMonth() + 1).padStart(2, '0');
            var day = String(date.getDate()).padStart(2, '0');
			
            return `${year}-${month}-${day}`;
        };
        
        $("#startDate").val(formatDate(lastMonth));
        $("#endDate").val(formatDate(today));
        
        
        
		$("#searchForm").submit(function(event) {
			if (!dateSearchForm()) {
                event.preventDefault();
            }
		});
        
    });
    
    function dateSearchForm() {
        var board_company = $("#board_company").val();
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        
        // 회사 선택 확인
        if (board_company === "") {
            alert("조회 하실 회사를 선택해 주세요.");
            return false;
        }

        // 날짜 입력 확인
        if (startDate === "" || endDate === "" || startDate === "--" || endDate === "--") {
            alert("조회 할 등록일자를 올바르게 입력해 주세요.");
            return false;
        }

        // 날짜 형식 확인 (YYYY-MM-DD)
        var datePattern = /^\d{4}-\d{2}-\d{2}$/;
        if (!datePattern.test(startDate) || !datePattern.test(endDate)) {
            alert("날짜 형식이 올바르지 않습니다. (YYYY-MM-DD 형식으로 입력해 주세요)");
            return false;
        }

        return true;
    }
    
    
    
</script>


<script>

    function submitForm(action) {
    	
    	var checkboxes = document.querySelectorAll('input[name="board_id"]:checked');
    	
        if (checkboxes.length === 0) {
            alert("수정하거나 삭제할 게시글을 선택해 주세요.");
            return false;
        }
        
        if (checkboxes.length > 1) {
        	alert("하나의 게시글을 선택해주세요.");
        	return false;
        }
        
        var password = prompt("비밀번호를 입력하세요:");
        if (password === null || password.trim() === "") {
            alert("비밀번호를 입력해야 합니다.");
            return false;
        }
        
        var passwordInput = document.getElementById("board_password");
        passwordInput.value = password;
        
        if (action === 'update') {
            document.getElementById('boardForm').action = 'updateBoard';
        } 
        if (action === 'delete') {
            document.getElementById('boardForm').action = 'deleteBoard';
        }
        
        document.getElementById('boardForm').submit();
    }
    
</script>

</head>
<body>
	<h3>조회화면</h3>
	<form id="searchForm" action="${contextPath }/searchBoard" method="get">
		<table>
			<tr>
				<th>회사</th>
				<td>
					<select name="board_company" id="board_company">
						<option value="">선택</option>
						<option value="company1">회사1</option>
						<option value="company2">회사2</option>
						<option value="company3">회사3</option>
						<option value="company4">회사4</option>
						<option value="company5">회사5</option>
					</select>
				</td>
				<th>등록일자</th>
				<td>
					<input type="text" id="startDate" name="startDate">
                    ~
                    <input type="text" id="endDate" name="endDate">
				</td>
				<th>등록자</th>
				<td>
					<input type="text" name="board_register" id="board_register">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="board_title" id="board_title" style="width:90%">
				</td>
			</tr>
		</table>
		
		<div class="button">
			<button type="submit">조회</button>
		</div>
	</form>
	
	<br>
	<br>
	<br>
	<form id="boardForm" method="get">
		<input type="hidden" id="board_password" name="board_password">
		<table border="1">
			<thead>
				<tr>
					<th>선택</th>
					<th>회사</th>
					<th>순번</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록일자</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty boardList}">
						<tr align="center" >
							<td colspan="6">등록된 게시글이 없습니다!</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<c:forEach var="boardDto" items="${boardList }">
							<tr>
								<td>
									<div>
										<input type="checkbox" name="board_id" id="board_id" value="${boardDto.board_id }">
									</div>
								</td>
								<td>
									<a href=" ${contextPath }/boardDetails?board_id=${boardDto.board_id}">
										${boardDto.board_company }		
									</a>
								</td>
								<td>
									<div>
										${boardDto.board_id }		                                    
									</div>
								</td>
								<td>
									<div>
										${boardDto.board_title }		                                    
									</div>
								</td>
								<td>
									<div>
										${boardDto.board_register }			                                    
									</div>
								</td>
								
								<td>
									<div>
										<fmt:formatDate value="${boardDto.board_date }" pattern="yyyy-MM-dd"></fmt:formatDate>			                                    
									</div>
								</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
						
						<tr>
		                    <td colspan="9" style="text-align: right; padding-right: 15px;">
		                        <strong>Total : ${fn:length(boardList)}</strong>
		                    </td>
		                </tr>
						
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<div class="button">
			<a href="${contextPath }/register"><button type="button" >등록</button></a>
			<button type="button" onclick="submitForm('update')">수정</button>
		   	<button type="button" onclick="submitForm('delete')">삭제</button>
	   	</div>
	   	
	</form>
</body>
</html>