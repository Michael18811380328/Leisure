/*admin文件夹下公共js*/
function sub() {
    if (form1.username.value == null || form1.username.value == "") {
        alert("请输入用户名");
        return false;
    }
    if (form1.password.value == null || form1.password.value == "") {
        alert("请输入密码");
        return false;
    }
    return true;
}

//<link rel="stylesheet" href="../css/admin.css"><script src="../js/admin.js"></script>