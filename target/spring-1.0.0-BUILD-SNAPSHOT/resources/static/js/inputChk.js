function checkIt() { // 회원등록시 필수항목들 입력, 입력안할시 리턴 못함
    var userinput = eval("document.getElementById(userinput)");
    var password = document.getElementById('pw');
    let regex = /^(?=.*[a-z])(?=.*[A-Z]).{4,12}$/;
    var jumin1 = userinput.jumin1.value
    var pw = password.match(regex)
    if(document.getElementById('id')==null) {
        alert("ID를 입력하세요");
        return false;
    }
    if(pw) {
        alert("비밀번호를 입력하세요");
        return false;
    }
    if(!userinput.name.value) {
        alert("사용자 이름을 입력하세요");
        return false;
    }
    if(jumin1==="") {
        alert("주민등록번호를 입력하세요");
        return false;
    }
    if(pw == null){
        alert("대소문자 포함 4~12글자 사이")
        return false;
    }
}