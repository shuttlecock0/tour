<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="${contextPath}/resources/bower_components/axios/dist/axios.min.js"></script>
<script>
	$(function() {
		$('.back').click(function() {
			location = '../list?page=${param.page}';
		});

		$('.delete').click(function() {
			$(".password-panel").show();
		});

		$('.cancel').click(function() {
			$(':password').val('');
			$('.password-panel').hide();
		});

		/* 		$('.password-panel').submit(function(e) {
		 e.preventDefault();
		 var result = confirm("삭제할까요?");
		 if (result) {
		 //ajax로 삭제
		 deleteBoard(${board.boardId}, $(':password').val());
		 }
		 }); */

		$('#delete-panel').deletePanel({
			triger : '.delete',
			url : '../delete/${board.boardId}',
			moveUrl : '../list?page=${param.page}'
		});
	})

	/* function deleteBoard(boardId, password) { 
		$.ajax({ 
			url : `../delete/\${boardId}?password=\${password}`, 
			type : 'delete', 
			dataType : 'json', 
			cache : false, 
			success : function(data) { 
				if(data.result == 'success') { 
					location = '../list'; 
				} else { 
					alert(data.result); 
				} 
			}, 
			error : function(xhr, statusText, errorThrown) { 
				console.log(`\${statusText} - \${xhr.status} , \$errorThrown`); 
			} 
		}); 
	} */
</script>

<h2 class="my-5">
	<i class="fas fa-file-alt"></i> ${board.title}
</h2>

<div style="overflow: hidden">
	<div class="float-left">작성자 : ${board.writer}, 조회수 :
		${board.readCnt}</div>
	<div class="float-right">
		수정일 :
		<fmt:formatDate value="${board.updateDate}"
			pattern="yyyy-MM-dd HH:mm:ss" />
	</div>
</div>
<hr />
${board.content}
<hr />
<!-- <form class="my-3 password-panel" style="display: none">
	비밀번호 : <input type="password" name="password" required>
	<button type="submit" class="btn btn-primary btn-sm">
		<i class="fas fa-times"></i> 삭제
	</button>
	<button type="button" class="btn btn-primary btn-sm cancel">
		<i class="fas fa-undo"></i> 취소
	</button>
</form> -->
<div class="text-center" id="delete-panel" style="display: none"></div>

<div class="text-center">
	<c:if test="${USER.userId == board.writer}">
		<a href="../edit/${board.boardId}?page=${param.page}"
			class="btn btn-primary ok text-white"> <i class="fas fa-edit"></i>
			수정
		</a>
		<button class="btn btn-danger delete">
			<i class="fas fa-trash"></i> 삭제
		</button>
	</c:if>
	<a href="../list?page=${page}" class="btn btn-primary back">
		<i class="fas fa-undo"></i> 목록
	</a>
</div>
