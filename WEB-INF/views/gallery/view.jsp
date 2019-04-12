<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="${contextPath}/resources/bower_components/axios/dist/axios.min.js"></script>
<script>
$(function(){
	$('#delete-panel').deletePanel({
		triger : '.delete',
		url : '../delete/${gallery.galleryId}',
		moveUrl : '../list?page=${param.page}'
	});
});
</script>
<h2 class="my-5">
	<i class="fas fa-file-alt"></i> ${gallery.title}
</h2>
<div style="overflow: hidden">
	<div class="float-left">작성자 : ${gallery.owner}, 조회수 :
		${gallery.readCnt}</div>
	<div class="float-right">
		수정일 :
		<fmt:formatDate value="${gallery.updateDate}"
			pattern="yyyy-MM-dd HH:mm:ss" />
	</div>
</div>
<hr />
${gallery.description}
<hr />

<%-- <!-- 사진 목록 -->
<c:forEach var="image" items="${gallery.list}" varStatus="s">
	<img src="${contextPath}/gallery/image/${image.imageId}" width="400">
	<img src="${contextPath}/gallery/thumb/${image.imageId}">
	<a href="${contextPath}/gallery/download/${image.imageId}"> <i
		class="fas fa-download"></i> 다운로드
	</a>
	<hr />
</c:forEach> --%>
<div id="gallery" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ul class="carousel-indicators">
		<c:forEach var="image" items="${gallery.list}" varStatus="s">
			<li data-target="#gallery" data-slide-to="${s.index}"
				<c:if test="${s.first}">class="active"></c:if>></li>
		</c:forEach>
	</ul>
	<!-- The slideshow -->
	<div class="carousel-inner">
		<c:forEach var="image" items="${gallery.list}" varStatus="s">
			<div class="carousel-item <c:if test="${s.first}">active</c:if>">
				<img src="../image/${image.imageId}">
			</div>
		</c:forEach>
	</div>
	<!-- Left and right controls -->
	<a class="carousel-control-prev" href="#gallery" data-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	</a> <a class="carousel-control-next" href="#gallery" data-slide="next">
		<span class="carousel-control-next-icon"></span>
	</a>
</div>

<hr/>

<div class="text-center" id="delete-panel" style="display: none"></div>

<div class="text-center">
	<c:if test="${USER.userId == gallery.owner}">
		<a href="../edit/${gallery.galleryId}?page=${param.page}"
			class="btn btn-primary ok text-white"> <i class="fas fa-edit"></i>
			수정
		</a>
		<button class="btn btn-danger delete">
			<i class="fas fa-trash"></i> 삭제
		</button>
	</c:if>
	<a href="../list?page=${page}" class="btn btn-primary back"> <i
		class="fas fa-undo"></i> 목록
	</a>
</div>

