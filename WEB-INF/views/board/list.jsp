<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
		<h2 class="my-5">
			<i class="fas fa-list"></i> 게시글 목록
		</h2>
		<div class="text-right">
			<a href="create?page=${pi.page}"><i class="fas fa-edit"></i> 글쓰기</a> (총 :
			${pi.totalCount} 건)
		</div>
		<table class="table table-striped table-hover">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
			<c:forEach var="board" items="${pi.list}">
				<tr>
					<td>${board.boardId}</td>
					<td><a href="view/${board.boardId}?page=${pi.page}">
							${board.title}
							<iot:newToday test="${board.regDate}"/>
						</a>
					</td>
					<td>${board.writer}</td>
					<td>${board.readCnt}</td>
					<td><fmt:formatDate value="${board.regDate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이지네이션 -->
		<iot:pagination pageInfo="${pi}"/>