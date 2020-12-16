<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/health/supplement.css" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

<script type="text/javascript">
$(document).ready(function() {

	var floatPosition = parseInt($(".floating-write").css('top'));
	
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
	
		$(".floating-write").stop().animate({
			"top" : newPosition
		}, 700);

	}).scroll();
});
</script>


<section>
    <div class="supplement-body">
        <div class="supplement-top">
            <div class="top-title">
             	<p>오늘 영양제</p>
            </div>
            <div class="top-text">
                <p>영양제 먹고 안먹고의 차이를 이것을 먹고 난 느꼈다 ! </p>
                <p>내가 먹는 영양제를 같이 공유해봐요 </p>
            </div>
        </div>

        <!-- 영양제 내용 -->
        <div class="supplement-content">
            <!-- 인기영양제 -->
            <div class="supplement-best">
                <div class="title-best">
                    <h2>인기 영양제</h2>
                </div>

                <div class="content-best">
                    <div class="best"> <!--이거 포문으로 돌릴거-->
                        <div class="best-image"></div>
                        <div class="best-subject">sdf</div>
                        <div class="best-user"> <p>조회수 </p></div>
                    </div>
                    <div class="best"> <!--이거 포문으로 돌릴거-->
                        <div class="best-image"></div>
                        <div class="best-subject">sdf</div>
                        <div class="best-user"> <p>조회수 </p></div>
                    </div>
                    <div class="best"> <!--이거 포문으로 돌릴거-->
                        <div class="best-image"></div>
                        <div class="best-subject">sdf</div>
                        <div class="best-user"> <p>조회수 </p></div>
                    </div>
                    <div class="best"> <!--이거 포문으로 돌릴거-->
                        <div class="best-image"></div>
                        <div class="best-subject">sdf</div>
                        <div class="best-user"> <p>조회수 </p></div>
                    </div>
                </div>

            </div>

            <!-- 영양제 게시판 -->
            <div class="supplement-bbs">
                <table class="supplement-table">
                    <thead class="s-thead">
                        <tr>
                            <th class="s-table-num">번호</th>
                            <th class="s-table-sub">제목</th>
                            <th class="s-table-date">날짜</th>
                            <th class="s-table-user">작성자</th>
                            <th class="s-table-count">조회수</th>
                        </tr>
                    </thead>
                    <tbody class="s-tbody">
                        <tr class="s-tbody-tr">
                            <td>1</td>
                            <td>밀크시슬은 이게 짱이에요</td>
                            <td>2020-10-10</td>
                            <td>이지영</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>밀크시슬은 이게 짱이에요</td>
                            <td>2020-10-10</td>
                            <td>이지영</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>밀크시슬은 이게 짱이에요</td>
                            <td>2020-10-10</td>
                            <td>이지영</td>
                            <td>10</td>
                        </tr>
                    </tbody>
                </table>
                <div class="supplement-paging">1 2 3</div>

                <div class="supplement-bbs-search">
                    <div>
                        <select name="" id="" class="sup-bbs-select">
                            <option value="">제목</option>
                            <option value="">제목</option>
                            <option value="">제목</option>
                        </select>
                        <input type="text" class="sup-bbs-input">
                        <button class="sup-bbs-btn">검색</button>
                    </div>
                </div>
            </div>

            <!-- 글쓰기 플로팅 -->
            <div class="floating-write">
                <div class="f-div">
                    <div class="floating-image"></div>
                    <p> 영양제<br> 추천하기</p>   
                </div>
            </div>

        </div>
    </div>
</section>