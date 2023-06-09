<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--아래는 css부분(부트스트랩 포함)--%>
<link href="${pageContext.request.contextPath}/resources/static/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/static/js/login.js" rel="script">
<script type="text/javascript">
    window.onpageshow = function (event) {
        if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
            // 이벤트 추가하는 곳
            window.location.reload();
        }
    }
</script>
<style>
    body.main {
        background-color: #f4f4ef;
    }
    div.login_box_layout{
        position: relative;
        min-width: 320px;
        min-height: 340px;
        padding: 170px 0 200px;
    }
    div.banner {
        margin: 0 30px 50px auto;
        text-align: center;
        height: auto;
        max-width: 100%;
    }

    div.sc_bar {
        text-align: center;
    }

    div.sc_box {
        width: 500px;
        min-height: 340px;
        margin: 0 auto;
        background-color: #D09AA9;
        color: white;
    }

    input.sc_at {
        width: 300px;
        margin-left: 15px;
        margin-top: 15px;
        padding: 4px 4px 4px 10px;
        border: none;
        border-bottom: whitesmoke 2px solid;
        transition: border-bottom-color .3s ease;
        font-size: 20px;
        font-weight: 500;
        height: 50px;
        background-color: #D09AA9;
    }

    .sc_at:focus {
        border-bottom: 2px #1ea1f7 solid;
    }

    input.sc_bt {
        text-align: center;
        padding: 5px;
        background-color: #1583B1;
        border-radius: 10px;
        font-size: 20px;
        color: white;
        margin: 1px 1px 1px 22px;
    }

    .sc_login {
        float: right;
        text-align: center;
        justify-content: center;
        padding: 10px;
        background-color: #2E3C7E;
        border-radius: 5px;
        border: none;
        font-size: 30px;
        color: #FBEAEB;
        margin: 38px 28px 1px 12px;
        height: 100px;
        width: 150px;
        transition: all .3s ease
    }

    .sc_login:disabled {
        opacity: 0.2;
    }

    p {
        text-align: center;
        margin-top: 14px;
        color: #2E3C7E;
    }

    span {
        color: whitesmoke;
        font-weight: 600
    }
</style>
<c:if test="${check!=null}">
    <script>
        alert("계정을 확인해주세요");
    </script>
</c:if>
<title>로그인</title>
<%--아래는 body 부분--%>
<body class="main">
<%--아래 로그인 박스 부분--%>
<div class="login_box_layout">
    <div class="sc_box">
        <%--    <%if(cooId!=null){%>
            <form action="loginPro.jsp" name="login" method="post" onsubmit="return loginCheck()">
                <script>
                    changeColor()
                </script>
                <table>
                    <tr>
                        <td><input type="text" class="sc_at" name="id" value="<%=cooId%>" ><%=cooId%></td>
                        <td rowspan="2">
                            <button type="submit" align="right" class="sc_login" id="button2"  disabled>로그인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" class="sc_at" name="pw" placeholder="비밀번호">
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="sc_bt" name="save_id" value="1"> ID 저장
                            <input type="checkbox" name="autologin" value="1"> 로그인 상태 유지</td>
                    </tr>
                </table>
                <p>
                    <a href="signup.jsp" style="margin-right: 10px;">회원가입</a>
                    <a href="findForm.jsp">ID/PW찾기</a>
                </p>
            </form>
            <%}else{%>--%>
        <form action="loginCheck" name="login" method="post" onsubmit="return loginCheck()">
            <div style="padding-top:10px;text-align: center">
                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                     class="bi bi-door-open"
                     viewBox="0 0 16 16">
                    <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
                    <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>
                </svg>
            </div>
            <table class="login_box">
                <tr>
                    <td><input type="text" class="sc_at" name="id" id="non_id" placeholder="아이디"
                               oninput="changeColor()">
                    </td>
                    <td rowspan="2">
                        <button type="submit" class="sc_login" id="button" disabled>로그인</button>
                    </td>

                </tr>
                <tr>
                    <td>
                        <input type="password" class="sc_at" name="pw" id="non_pw" placeholder="비밀번호">
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 15px">
                        <%-- <input type="checkbox" class="sc_bt" name="save_id" value="1"> <span>ID 저장</span>--%>
                        <input type="checkbox" id="auto_login" name="auto_login" value="1"
                               style="margin-left: 10px;height: 10px;width: 10px">
                        <label for="auto_login"><span>로그인 상태 유지</span></label>
                    </td>
                </tr>
            </table>
            <p>
                <a href="signup" style="margin-right: 10px;"><span>회원가입</span></a>
                <a href="findForm.jsp"><span>ID/PW찾기</span></a>
            </p>
        </form>
    </div>
</div>
</body>
<script>
    function changeColor() {
        switch (document.getElementById('non_id').value !== '' && document.getElementById('non_pw').value !== '') {
            case true:
                document.getElementById('button').removeAttribute('disabled');
                document.getElementById('button2').removeAttribute('disabled');
                break;
            case false:
                document.getElementById('button').disabled = true;
                document.getElementById('button2').disabled = true;
                break;
        }
    }

    document.getElementById('non_id').onfocus = function () {
        document.getElementById('non_id').removeAttribute('placeholder');
    }
    document.getElementById('non_pw').onfocus = function () {
        document.getElementById('non_pw').removeAttribute('placeholder');
    }
    document.getElementById('non_pw').onblur = function () {
        document.getElementById('non_pw').placeholder = '비밀번호';
    }
    document.getElementById('non_id').onblur = function () {
        document.getElementById('non_id').placeholder = '아이디';
    }
    document.getElementById('non_id').addEventListener('keyup', changeColor)
    document.getElementById('non_pw').addEventListener('keyup', changeColor)
    document.getElementById('non_id').addEventListener('focus', focus)
</script>