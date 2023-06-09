function chat_open() {
    url = "https://0c04-58-73-200-217.ngrok-free.app"
    open(url, "confirm", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600, height=900")
}
function profile_open(){
    if(document.getElementById('nick').value) {
        var nick = document.getElementById('nick').value;
        url = "profile.jsp?nick="+nick
    }else {
        url = "profile.jsp?nick=" + nick
    }
    open(url, "confirm", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600, height=600")
}
function my_Profile_open(){
    url = "profile.jsp"
    open(url, "confirm", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600, height=600")
}