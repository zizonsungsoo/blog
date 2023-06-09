<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--뒤로가기 이벤트 발생시 새로고침--%>
<script type="text/javascript">
    window.onpageshow = function (event) {
        if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            history.go(0);
        }
    }
</script>
<%--부트스트랩, 제이쿼리, 플러그인 불러오는 부분--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<%----------유효성 검사 파트-----------%>
<script type="text/javascript">
    $(document).ready(function () {
        $.validator.addMethod(
            "regex",
            function (value, element, regexp) {
                var re = new RegExp(regexp);
                return this.optional(element) || re.test(value);
            },
            "Please check your input."
        );
        $('#registerForm').validate({
            rules: {
                id: {required: true, minlength: 4, maxlength: 15, regex:/^[a-z0-9]{4,15}$/,remote:'id_chk'},
                pw: {
                    required: true,
                    regex: /^(?=.*[a-z])(?=.*[A-Z]).{4,12}$/,
                    rangelength: [4, 15]
                },
                passwd2: {equalTo: pw},
                nick: {required: true,remote:'nick_chk'},
                name: {
                    required: true,
                    regex:/^[가-힝]{2,4}$/
                },
                email: {required: true, email: true},
                phone: {
                    required: true,
                    regex: /^\d{2,3}-?\d{3,4}-?\d{4}$/
                },
                jumin1: {
                    required: true,
                    number:true,
                    minlength: 6
                },
                jumin2: {
                    required: true,
                    number: true,
                    regex: /^(^[1-4])/
                }
            },

            messages: {

                id: {
                    required: "아이디를 입력하시오.",
                    minlength: jQuery.format("아이디는{0}자 이상으로 입력해주세요."),
                    regex:"소문자 및 숫자만 가능합니다.",
                    remote: jQuery.format("입력하신 {0}는 이미 존재하는 아이디입니다.")
                },
                pw: {
                    required: "비밀번호를 입력하시오",
                    rangelength: jQuery.format("비밀번호는{0}글자 이상 {1}글자 이하로 입력해주세요"),
                    regex: "대,소문자,특수문자",
                    maxlength: "4글자 이상 15자 이하로 해주세요"
                },
                passwd2: {
                    equalTo: "암호를 다시 확인해주세요.",
                    minlength: jQuery.format("4글자 이상 15자 이하로 해주세요"),
                },
                name: {required: "이름을 입력해주세요",regex:"이름을 확인해주세요"},
                nick: {
                    required: "닉네임을 입력해주세요",
                    remote: jQuery.format("입력하신 {0}는 이미 존재하는 닉네임입니다.")
                },
                jumin1: {
                    required: "앞자리를 입력해주세요",
                    number: "숫자만 입력해주세요",
                    minlength: "6자리를 입력해주세요"
                },
                jumin2: {
                    required: "뒷자리를 입력해주세요",
                    number: "숫자만 입력해주세요",
                    regex: "1~4로 시작해주세요"
                },
                email: {
                    required: "이메일을 입력하시오.",
                    email: "올바른 이메일을 입력하시오.",
                    regex: "이메일 형식을 확인해주세요"
                },
                phone: {
                    required: "휴대폰 번호를 입력하시오.",
                    regex: "번호 규격을 맞춰주세요"
                }
            },
        })
    });
</script>
<%--label이 입력시 사라지도록 하는 부분, 모든값이 입력 됐을때 가입 버튼 활성화--%>
<script>
    $(document).ready(function () {
        var placeholderTarget = $('.item input[type="text"], .item input[type="password"],.item input[type="email"]');

        //포커스시
        placeholderTarget.on('focus', function () {
            $(this).siblings('label').fadeOut('fast');
        });

        //포커스아웃시
        placeholderTarget.on('focusout', function () {
            if ($(this).val() === '') {
                $(this).siblings('label').fadeIn('fast');
            }
        });
    });
</script>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 폼</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/inputForm.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color:#dcdcdc">
<div style="width: 600px;height:950px;background-color:white;margin: 0 auto;border-radius: 10px;margin-top: 20px;margin-bottom: 20px;padding: 25px 25px 25px 25px">
    <div style="text-align: center;">
        <a href="mainPage.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="75" height="75" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
        </svg></a>
    </div>
    <!-- 1. 로고 -->
    <%-------------------------배너&툴바---------------------------%>
    <!-- 2. 필드 -->
    <div style="text-align:center">

        <form class="input_box" method="post" id="registerForm" action="signuppro" name="userinput">
            <div class="item">
                <label for="id">아이디</label>
                <input type="text" name="id" id="id" required>
                <label for="id" class="error" style="position: relative;"></label>
            </div>
            <div class="item">
                <label for="pw">비밀번호</label>
                <input type="password" name="pw" id="pw">
                <label for="pw" class="error" style="position: relative;"></label>
            </div>
            <div class="item">
                <label for="passwd2">비밀번호 확인</label>
                <input type="password" name="passwd2" id="passwd2">
                <label for="passwd2" class="error" style="position: relative;"></label>
            </div>
            <div class="item">
                <label for="nick">닉네임</label>
                <input type="text" name="nick" id="nick">
                <label for="nick" class="error" style="position: relative;"></label>
            </div>
            <div class="item">
                <label for="name">이름</label>
                <input type="text" name="name" id="name">
                <label for="name" class="error" style="position: relative;"></label>
            </div>
            <div class="item">
                <div class="jumin_box">
                    <div>
                        <label for="jumin1">앞자리</label>
                        <input type="text" name="jumin1" id="jumin1" maxlength="6">-
                        <label for="jumin1" class="error" style="position: relative;"></label>
                    </div>
                    <div>
                        <label for="jumin2" style="left: 255px">뒷자리</label>
                        <input type="password" name="jumin2" id="jumin2" maxlength="7">
                        <label for="jumin2" class="error" style="position: relative;"></label>
                    </div>
                </div>

            </div>
            <!-- 5. 이메일_전화번호 -->
            <div class="item">
                <label for="email">이메일을 입력해주세요</label>
                <input type="text" name="email" id="email">
                <label for="email" class="error" style="position: relative;"></label>
            </div>
            <div class="item">
                <label for="phone">전화번호를 입력해주세요</label>
                <input type="text" name="phone" id="phone">
                <label for="phone" class="error" style="position: relative;"></label>
            </div>
            <!-- 6. 가입하기 버튼 -->
            <input type="submit" class="item"   >
        </form>
    </div>
</div>
</body>
</html>
