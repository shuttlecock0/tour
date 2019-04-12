<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h2 class="my-5">
	<i class="fas fa-edit"></i> 갤러리 만들기
</h2>
<form:form modelAttribute="gallery" enctype="multipart/form-data">
	<div class="form-group">
		<label for="owner">소유자</label> <input type="hidden" name="owner"
			value="${USER.userId}" />
		<p class="form-control-static">${USER.userId}</p>
	</div>
	<div class="form-group">
		<label for="password">비밀번호</label>
		<form:password path="password" class="form-control" />
		<form:errors path="password" element="div" cssClass="error" />
	</div>
	<div class="form-group">
		<label for="title">제목</label>
		<form:input path="title" class="form-control" />
		<form:errors path="title" element="div" cssClass="error" />
	</div>
	<div class="form-group">
		<label for="description">내용</label>
		<form:textarea path="description" class="form-control" rows="5" />
	</div>
	<div class="form-group">
		<label>이미지 파일들</label> 
			<input type="file" name="files" class="form-control-file" 
			multiple="multiple" accept="image/*">
	</div>
	<div class="text-center">
		<button type="submit" class="btn btn-primary ok">
			<i class="fas fa-check"></i> 완료
		</button>
		<a href="list?page=${param.page}" class="btn btn-primary back"> <i
			class="fas fa-undo"></i> 목록
		</a>
	</div>
</form:form>