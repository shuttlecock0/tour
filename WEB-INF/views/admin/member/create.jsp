<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="${contextPath}/resources/js/member.js"></script>
<script>
$(function(){
	$('.id-check').checkUserId();
	$('#member').checkPassword();
})
</script>
<div class="row">
	<div class="col-sm-6 mx-auto">
		<h2 class="my-5 text-primary">
			<i class="fas fa-user-plus"></i> 회원 추가
		</h2>
		
		<form:form modelAttribute="member" enctype="multipart/form-data">
			<div class="form-group">
				<label for="userId">사용자 ID
					<button type="button" class="btn btn-sm btn-primary id-check">
						<i class="fas fa-user-check"></i> 중복 체크
					</button>
					<span id="message"></span>
				</label>
				<form:input path="userId" class="form-control" />
				<form:errors path="userId" element="div" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label>
				<form:password path="password" class="form-control"/>
				<form:errors path="password" element="div" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="password2">비밀번호 확인</label>
				<input type="password" id="password2" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<form:input path="name" class="form-control"/>
				<form:errors path="name" element="div" cssClass="error" />
			</div>
			<div class="mb-3">
				<label for="avata">아바타 이미지</label>
				<input type="file" name="avata"/>
			</div>
			<div class="form-group">
				<label for="userLevel">사용자 레벨</label>
				<form:select path="userLevel" class="form-control"
					items="${userLevels}" itemLabel="label" itemValue="value"/>
				<%--<option value="">선택하세요</option>
					<form:options items="${userLevels}"
						itemLabel="label" itemValue="value"/> --%>
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<form:input path="email" class="form-control"/>
				<form:errors path="email" element="div" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label>
				<form:input path="phone" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="address">주소</label>
				<form:input path="address" class="form-control"/>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary" disabled>
					<i class="fas fa-check"></i> 완료
				</button>
				<a href="list?page=${param.page}" class="btn btn-primary back">
					<i class="fas fa-undo"></i> 목록
				</a>
			</div>
		</form:form>
	</div>
</div>