<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
        .MainBody {
        
            width: 1300px;
            height: 600px;
            margin: 250px auto 0 auto;

        }

        .faq-page {
            width: 100%;
            height:20px;
            text-align: right;
        }
      
        .faq-table {
            width: 1000px;
            margin: 0 auto;
           
        }

        .faq-tr {
            width: 100%;
            height: 50px;
            background: rgb(240,240,240);
        }

        .faq-qu {
            width: 500px;
            text-align: center;
            margin: 0 auto;
        }

        .faq-subject {
            width: 100px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background: black;
            border-radius: 5px;
            color: white;
            margin: 0 auto;
        }

        .faq-subject-Answer {
            width: 100px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background: red;
            border-radius: 5px;
            color: white;
            margin: 0 auto;
           

        }

        .faq-qu-Answer {
            width: 500px;
            text-align: center;
            margin: 0 auto;
        }

        .faq-tr-Answer {
            display: none;
            background-color: rgb(250, 250, 250);
        }

        .faq-table2 {
            width: 1000px;
            margin: 0 auto;
        }

        .faq-reset {
            width: 100px;
          
        }
        .faq-reset button{
        	width:70px;
          	height: 40px;
            line-height: 40px;
            text-align: center;
            background: black;
            border-radius: 5px;
            color: white;
            margin: 0 auto;
        }

        .faq-search {
            width: 200px;
            text-align: right;
        }

        .faq-search>input {
            width: 200px;

        }

        .faq-seachButton {
            width: 100px;
        }

        .faq-createdButton {
            width: 100px;
            text-align: right;
            
        }
        .faq-createdButton button{
       
       		 width:70px;
          	height: 40px;
            line-height: 40px;
            text-align: center;
            background: black;
            border-radius: 5px;
            color: white;
            margin: 0 auto;
        }
        .faq-footerBody{
        	width:100%;
        }

        form[name="faq-seraChSubmit"] {
         	margin-bottom:100px;
        }

        .faq-paging {
            width: 1000px;
            margin: 0 auto;
            text-align: center;
     
        }
    </style>

    <script>
        $(function () {
            $("body").on("click", ".faq-tr", function () {
                var fa = $(this);
                var da = fa.next();
                da.hide(1000);

                var visible = da.is(":visible");
                if (!visible) {
                    $(".faq-tr-Answer").hide(1000);
                    da.show(1000);
                }
            });
        });
    </script>
</head>


    <div class="MainBody">
        <table class="faq-table">
            <tr>
                <td class="faq-page" colspan="2"> ${dataCount}개 [${page}/${total_page}]페이지</td>
            </tr>
    	<c:forEach var ="dto" items="${list}">
            <tr class="faq-tr">
                <td class="faq-td">
                    <div class="faq-subject">
                        <span>${dto.questionSelect}</span>
                    </div>
                </td>
                <td>
                    <div class="faq-qu">
                        <span>${dto.question}</span>
                    </div>
                </td>
            </tr>
            <tr class="faq-tr-Answer">
                <td class="faq-td-Answer">
                    <div class="faq-subject-Answer">
                        <span>A</span>
                    </div>
                </td>
                <td>
                    <div class="faq-qu-Answer">
                        <span>${dto.questionAnswer}</span>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </table>
    </div>
       
        <div class="faq-paging">123</div>
        <form method="post" name="faq-seraChSubmit">
            <table class="faq-table2">
                <tr class="faq-seachBody">
                    <td class="faq-reset"><button>새로고침 </button></td>
                    <td class="faq-search"><input type="text" name="keyword"></td>
                    <td class="faq-seachButton"><button type="submit">검색</button></td>
                    <td class="faq-createdButton">
                    <c:if test="${dto.userId}=='admin'">
                    <button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/faq/created';">글올리기</button>
                    </c:if>
                    </td>
                </tr>
            </table>
        </form>
       