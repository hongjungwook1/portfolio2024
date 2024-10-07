<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 화면</title>
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
</head>
<body>
	<h3>상세화면</h3>
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
						${boardDto.board_title }
					</td>
			</tr>
		</table>
		<table>
			<tr>
				<th align="left">내용</th>
			</tr>
			<tr>
				<td>
					<textarea name="board_contents" id="board_contents" rows="30" cols="145" readonly="readonly" style="width:90%; hegiht: 75%;">${boardDto.board_contents }</textarea>
				</td>
		</table>
		<br>
		<a href="${contextPath }/"><button style="float: right;">닫기</button></a>
</body>
</html>