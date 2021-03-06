<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/css/main.css" rel="stylesheet">

<title>QNA</title>
</head>
	<div id="gnb">
        <%@ include file="../inc/sidemenu.jsp" %>
    </div>	
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/qna/write.do");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	function fn_valiChk(){
		var regForm = $("form[name='writeForm'] .form-control").length;
		for(var i = 0; i<regForm; i++){
			if($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null){
				alert($(".form-control").eq(i).attr("title"));
				return true;
			}
		}
	}
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .form-control").length;
			for(var i = 0; i<regForm; i++){
				if($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null){
					alert($(".form-control").eq(i).attr("title"));
					return true;
				}
			}
		}
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
			<h1>QNA</h1>
			<hr>
				
				<form name="writeForm" method="post" action="/qna/write.do">
					<table>
						<tbody>
							<c:if test="${user.id != null}">
								<div class="mb-3">
								<label for="title">??????</label>
								<input type="text" id="title" name="title" class="form-control" title="????????? ???????????????."/>
								</div>
									
								<div class="mb-3">
									<label for="content">??????</label><br>
									<textarea id="content" rows="5" name="content" class="form-control" title="????????? ???????????????."></textarea>
								</div>
																	
								<div class="mb-3">
								<label for="writer">?????????</label>
								<input type="text" id="writer" name="writer" class="form-control" title="???????????? ???????????????." value="${user.id}" readonly="readonly" />
								</div>
	
								<div>	
								<input type="button" class="write_btn btn btn-primary" value="??????">					
								<input type="button" class="btn btn-warning" value="??????" onclick= "location.href = '/qna/list.do'">
								</div>
								
								
							</c:if>
							<c:if test="${user.id == null}">
								<p>????????? ?????? ???????????? ??? ????????????.</p>
							</c:if>
						</tbody>			
					</table>
				</form>
			<hr/>	
		</div>
	</div>
	
	<div class="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>	
	
		
</body>
</html>