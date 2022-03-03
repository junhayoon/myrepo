<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/css/main.css" rel="stylesheet">
<title>공지사항</title>
</head>
	<div id="gnb">
        <%@ include file="../inc/sidemenu.jsp" %>
    </div>
	<script type="text/javascript">	
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/notice/updateView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			});
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
								
				formObj.attr("action", "/notice/delete.do");
				formObj.attr("method", "post");
				formObj.submit();	
				}
			});
			
			//like_btn
			$(".like_btn").on("click", function(){
				if(confirm("해당 글을 추천하시겠습니까?")){
				formObj.attr("action", "/notice/readView.do?bno=${read.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}");
				formObj.attr("method", "post");
				formObj.submit();			
				alert("해당 글을 추천하였습니다.")
				}
			});
			
			// 목록
			$(".list_btn").on("click", function(){
				location.href = "/notice/list.do?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
			
			//신고하기
			$(".AAAA_Btn").on("click", function(){
								
				var formObj = document.createElement('form'); 
				// set attribute (form) 

                     formObj.method = 'post';
                     formObj.action = '/notice/goReport.do'; 
                     formObj.target = '_blank';

				
				
				var inputId=document.createElement('input');
				var inputPerPageNum = document.createElement('input'); 
				var inputSearchType = document.createElement('input');
				var inputSearchType = document.createElement('input');
				var inputKeyword =document.createElement('input');
				
				// set attribute (input) 
				inputId.setAttribute("type", "hidden"); 
				inputId.setAttribute("name", "id"); 
				inputId.setAttribute("value", "${read.writer}");
				
				inputPerPageNum.setAttribute("type", "hidden"); 
				inputPerPageNum.setAttribute("name", "perPageNum"); 
				inputPerPageNum.setAttribute("value", "${scri.perPageNum}"); 
				
				inputSearchType.setAttribute("type", "hidden"); 
				inputSearchType.setAttribute("name", "searchType"); 
				inputSearchType.setAttribute("value", "${scri.searchType}");
				
				inputKeyword.setAttribute("type", "hidden"); 
				inputKeyword.setAttribute("name", "keyword"); 
				inputKeyword.setAttribute("value", "${scri.keyword}"); 
				
				
				// append input (to form) 
				formObj.appendChild(inputId); 
				formObj.appendChild(inputPerPageNum); 
				formObj.appendChild(inputSearchType); 
				formObj.appendChild(inputKeyword); 
				// append form (to body) 
			//
			
			document.body.appendChild(formObj);

					
				formObj.submit();
				
				
				//self.location = "/notice/goReport.do?id=${read.writer}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
			
			
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "/notice/replyWrite.do");
				formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/notice/replyUpdateView.do?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/notice/replyDeleteView.do?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
		});
	</script>
	
<body> 
	<div id="gnb">
        <%@ include file="../inc/gnb.jsp" %>
    </div>

	<div class="logo">
		<h1>
		<a href="/"><img src="../resources/images/iteam.png" alt="logo" width="200px"/></a>
		</h1>
	</div>

	<div class="main-menu">
		<%@ include file="../inc/main-menu.jsp" %>
    </div>
		
	<div class="container">
		<div class="content">
		<h1>공지사항</h1>
		<hr>
		
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="content" rows="9" name="content" class="form-control" readonly="readonly"><c:out value="${read.content}" /></textarea>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="writer" name="writer" class="form-control" value="${read.writer}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />	
				</div>

				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">조회수</label>
					<fmt:formatNumber value="${read.cnt}"/>	
				</div>
								
				<div>
					<c:if test="${admin.id eq 'admin' }"><button type="button" class="update_btn btn btn-info">수정</button></c:if>
					<c:if test="${admin.id eq 'admin' }"><button type="button" class="delete_btn btn btn-warning">삭제</button></c:if>
					<button type="button" class="list_btn btn btn-primary">목록</button>	
					<c:if test="${admin.id eq 'admin' }"><button type="button" class="AAAA_Btn btn btn-danger">신고하기</button></c:if>	
					<button type="button" class="like_btn btn btn-default blue"> <span class="glyphicon glyphicon-thumbs-up"></span>추천 ${read.recommend}</button>
				</div>
				
				<hr>
				
				<!-- 댓글 -->
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li>
								<p>
								<span class="glyphicon glyphicon-user"></span>
								${replyList.writer}
								&nbsp;&nbsp;
								<span class="glyphicon glyphicon-calendar"></span>
								<fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd hh:mm:ss" />
								<c:if test="${user.id eq replyList.writer}">
								<button type="button" class="replyUpdateBtn btn btn-warning btn-xs" data-rno="${replyList.rno}">수정</button>
								<button type="button" class="replyDeleteBtn btn btn-danger btn-xs" data-rno="${replyList.rno}">삭제</button>
								</c:if>
								</p>
								<p>${replyList.content}</p>
								<hr>
							</li>
						</c:forEach>   
					</ol>
				</div>
				
				<hr>
				
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
					<div class="form-group">
						<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
						<div class="col-sm-10">
							<input type="text" id="writer" name="writer" class="form-control" value="${user.id}"  readonly="readonly" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">댓글 내용</label>
						<div class="col-sm-10">
							<input type="text" id="content" name="content" class="form-control"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-success">작성</button>
						</div>
					</div>
				</form>
			<hr />
		</div>
	</div>

	<div class="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>	
		
</body>
</html>