<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script
	src="${contextPath}/resources/bower_components/tinymce/tinymce.min.js"></script>

<script>
	$(function() {
		/* tinymce.init({
			selector: 'textarea',
			language: 'ko_KR',
			height: 500
		}); */
		tinymce.init({
					selector : "textarea",
					language : "ko_KR",
					plugins : "uploadimage autolink autosave code link media image table textcolor autoresize",
					toolbar : "undo redo | styleselect | forecolor bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | table link media custom_image code ",
		});
	})
</script>
<h2 class="my-5">
	<i class="fas fa-edit"></i> 게시글 작성
</h2>
<form:form modelAttribute="board">
	<div class="form-group">
		<label for="writer">작성자</label>
		<form:input path="writer" class="form-control" />
		<form:errors path="writer" element="div" cssClass="error" />
	</div>
	<div class="form-group">
		<label for="password">비밀번호</label>
		<form:input path="password" class="form-control" />
		<form:errors path="password" element="div" cssClass="error" />
	</div>
	<div class="form-group">
		<label for="title">제목</label>
		<form:input path="title" class="form-control" />
		<form:errors path="title" element="div" cssClass="error" />
	</div>
	<div class="form-group">
		<label for="content">내용</label>
		<form:textarea path="content" class="form-control" rows="10" />
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

