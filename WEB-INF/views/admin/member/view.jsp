<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="${contextPath}/resources/bower_components/axios/dist/axios.min.js"></script>
<script>
$(function(){
	$('#delete-panel').deletePanel({
		triger : '.delete',
		url : '../delete/${member.userId}',
		moveUrl : '../list?page=${param.page}'
	});
});
</script>
<div class="row">
	<div class="col-sm-6 mx-auto">
		<h2 class="my-5 text-primary">
			<i class="fas fa-user"></i> 사용자 정보
		</h2>
		<div class="my-1">사용자 ID : 
			<img src="${contextPath}/member/avata/${member.userId}"
				class="rounded-circle avata-sm">
			${member.userId}</div>
		<div class="my-1">이름 : ${member.name}</div>
		<div class="my-1">사용자 레벨 : ${member.userLevel.label}</div>
		<div class="my-1">이메일 : ${member.email}</div>
		<div class="my-1">전화번호 : ${member.phone}</div>
		<div class="my-1">주소 : ${member.address}</div>
		<div class="my-1">
			가입일 :
			<fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd" />
		</div>
		<div class="my-1">
			수정일 :
			<fmt:formatDate value="${member.updateDate}" pattern="yyyy-MM-dd" />
		</div>
	</div>
</div>

<hr />

<div class="text-center" id="delete-panel" style="display: none"></div>

<div class="text-center">
	<a href="../edit/${member.userId}?page=${param.page}"
		class="btn btn-primary text-white"><i class="fas fa-edit"></i> 수정</a>
	<button class="btn btn-danger delete">
		<i class="fas fa-trash"></i> 삭제
	</button>
	<a href="../list?page=${param.page}" class="btn btn-primary text-white">
		<i class="fas fa-undo"></i> 목록
	</a>
</div>