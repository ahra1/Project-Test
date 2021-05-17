<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 목록</title>
<style type="text/css">
.paging{color: blue; text-decoration: none;}
.currentPaging { color: red; text-decoration: underline;}
</style>
</head>
<body>
	<table border="1">
			<tr bgcolor="ffff00">
				<th width="70">번호</th>
				<th width="100">이미지</th>
				<th width="100">상품명</th>
				<th width="70">단가</th>
				<th width="70">개수</th>
				<th width="70">합계</th>
			</tr>
			
			<c:forEach var="dto" items="${list}">
				<tr bgcolor="ffffcc" align="center">
					<td>${dto.seq }</td>
					<td><a href="../imageboard/imageboardView?seq=${dto.seq}&pg=${pg}">  <!-- pg값은 공유되어 있어서 dto를 통해서 얻어올 이유가 없음 -->
							<img alt="그림" src="../storage/${dto.image1 }" width="80" height="60">
						</a>
					</td>
					<td>${dto.imageName }</td>
					<td>${dto.imagePrice }</td>
					<td>${dto.imageQty }</td>
					<td>${dto.imagePrice * dto.imageQty }</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="6" align="center">
					<c:if test="${startPage > 3 }">
						[<a class="paging" href="../imageboard/imageboardList?pg=${startPage-1}">이전</a>]
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${pg == i }">
							[<a class="currentPaging" href="../imageboard/imageboardList?pg=${i }">${i }</a>]
						</c:if>
						<c:if test="${pg != i }">
							[<a class="paging" href="../imageboard/imageboardList?pg=${i }">${i }</a>]  <!-- if문을 두개로 나눈 이유는 현재 페이지 선택시 클릭되면 색을 바꾸기 위해서 -->
						</c:if>
					</c:forEach>
					
					<c:if test="${endPage <totalP }">
						[<a class="paging" href="../imageboard/imageboardList?pg=${endPage+1}">다음</a>]
					</c:if>
				</td>
			</tr>
		</table>
		<a href="imageboardWriteForm">이미지 등록</a>
</body>
</html>