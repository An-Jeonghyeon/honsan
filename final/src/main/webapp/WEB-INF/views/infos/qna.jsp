<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/infos.css" type="text/css">


<script type="text/javascript">
	function bgLabel(ob, id) {
		if (!ob.value) {
			document.getElementById(id).style.display = "";
		} else {
			document.getElementById(id).style.display = "none";
		}
	}

	function searchList() {
		var f = document.searchForm;
		f.submit();
	}

	function article(num) {
		var url = "${articleUrl}&num=" + num;
		location.href = url;
	}
</script>



<!-- 검색 부분 -->
<div class="qnasearchlist">
<div style="width: 1000px; margin: 0px auto;">
	<form name="qnasearchForm"
		action="${pageContext.request.contextPath }/"
		method="post">
			<table style="width:1000px; margin: 15px auto; border-spacing: 0px;">
				<tr>
					<td align="center" class="qnatitle"><br>질문과 답변</td>
				</tr>
				<tr>
					<td align="center">HOLLO에게 묻고 싶은 질문을 해보세요.</td>
				</tr>
				<tr height="60">
					<td align="center"><label for="town" id="lblTown" class="qnalbl"><i class="fas fa-search"></i>궁금한 것을 검색해보세요.
							</label> <input type="text" name="town" id="town"
						class="qnasearchTF" maxlength="20" tabindex="2"
						onfocus="document.getElementById('lblTown').style.display='none';"
						onblur="bgLabel(this, 'lblTown');">
						<button type="button" class="qnasearchbtn" onclick="searchList()">검색</button>
					</td>
				</tr>
				
				
			</table>
	</form>
</div>

</div>
	
	
<!-- 리스트 부분 -->	
<div style="width: 1000px; margin: 0px auto;">
	
	<table>
	<tr>
		<td align="right"><button type="button">글 올리기</button> </td>
	
	</tr>
	
	
	
	
	</table>
	
	
</div>


<div class="body-container">



</div>