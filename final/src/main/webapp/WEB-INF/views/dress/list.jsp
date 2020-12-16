<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="dress-Body">
	<div class="dress-MainBody">
		<div class="dress-InnerBody">
			<div class="dress-MainContent">
				<div class="dress-BestContentName">
					<p>
						<i class="fas fa-crown fa-3x"></i>
					</p>
					<span class="dress-Text">인기</span><span>게시글</span>

				</div>
				<div class="dress-BestContent">
					<a href=""><div class="dress-subContent-InnerImage"></div></a>
					<div class="dress-subContent-InnerText">
						<span>오늘 출근 할때 입었던 옷이에요 정말입고 싶었던 옷인데</span>
					</div>
				</div>
				<div class="dress-BestContentText">여기에 무엇을 넣어야 할까?</div>
			</div>
			<div class="dress-subContent">
				<a href=""><div class="dress-subContent-InnerImage">게시글 그림</div></a>
				<div class="dress-subContent-InnerText">
					<span>오늘 출근 할때 입었던 옷이에요 정말입고 싶었던 옷인데</span>
				</div>
			</div>
		</div>
		<form action="" name="dress-CreatedFrom" method="post">
			<div class="dress-searchFormBody">
				<div class="dress-pagingNum">
					<a href=""> 1</a>
				</div>
				<div class="dress-searchBody">
					<button class="dress-Resetbtn dress-Btn" type="reset">
						<i class="fas fa-redo-alt fa-2x"></i>
					</button>
					<select class="dress-Selectbtn" name="" id="">
						<option value="#">::검색::</option>
						<option value="">제목</option>
						<option value="">내용</option>
						<option value="">작성자</option>
					</select> <input class="dress-Search" type="text" name="" id="">
					<button class="dress-Searchbnt dress-Btn" type="button" onclick="">검색</button>
					<button class="dress-Createdbtn dress-Btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/dress/created'">글쓰기</button>
				</div>
			</div>
		</form>
	</div>
</div>