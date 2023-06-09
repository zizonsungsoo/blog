/*
로그인 유효성검사
*/
function loginCheck(){
    var id = document.login.id.value;
    var pw = document.login.pw.value;

    if(id == ""){
        alert("아이디를 입력해주세요");
        return false
    }
    if(pw == ""){
        alert("비밀번호를 입력해주세요");
        return false
    }
}