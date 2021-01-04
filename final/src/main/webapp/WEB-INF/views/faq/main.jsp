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
            background: rgb(100,100,100);
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
                da.hide(200);

                var visible = da.is(":visible");
                if (!visible) {
                    $(".faq-tr-Answer").hide(200);
                    da.show(200);
                }
            });
        });
    </script>
</head>


    <div class="MainBody">
    	
        <table class="faq-table">
            <tr>
                <td class="faq-page" colspan="2"> 1개 [1/3]페이지</td>
            </tr>
            <tr class="faq-tr">
                <td class="faq-td">
                    <div class="faq-subject">
                        <span>회원관련</span>
                    </div>
                </td>
                <td>
                    <div class="faq-qu">
                        <span>회원 관련 탈퇴는 어떻게 하나요?</span>
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
                        <span>내정보에 들어가서 회원 탈퇴를 누르시면 됩니다</span>
                    </div>
                </td>
            </tr>
        </table>
    </div>
       
        <div class="faq-paging">123</div>
        <form action="" name="faq-seraChSubmit">
            <table class="faq-table2">
                <tr class="faq-seachBody">
                    <td class="faq-reset"><button>새로고침 </button></td>
                    <td class="faq-search"><input type="text" value=""></td>
                    <td class="faq-seachButton"><button type="submit">검색</button></td>
                    <td class="faq-createdButton"><button type="button">글올리기</button></td>
                </tr>
            </table>
        </form>
       