<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>登陆页面</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            max-width: 500px;
            margin: 50px auto;
        }
        input[type="text"], input[type="password"] {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            width: 100%;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #3e8e41;
        }
        .register {
            text-align: center;
            margin-top: 20px;
        }
        .register a {
            color: #4CAF50;
            text-decoration: none;
        }
        .register a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<form action=${pageContext.request.contextPath}/user/login method="post" id="login-form">
    <h2>登陆</h2>
    <label for="uname">用户名：</label>
    <input type="text" id="uname" name="uname" required>
    <label for="password">密码：</label>
    <input type="password" id="password" name="password" required>
    <label for="rights">用户类型：</label>
    <select id="rights" name="rights">
        <option value="2">用户</option>
        <option value="1">商家</option>
    </select><br>
    <label>验证码：</label>
    <input type="text" name="captcha" id="captcha">
    <img src="${pageContext.request.contextPath}/captcha" id="captcha-img" onclick="refreshCaptcha()">
    <input type="submit" value="登陆">
    <span style="color: red">${msg}</span>
    <div class="register">
        还没有账号？<a href="${pageContext.request.contextPath}/toregister">注册</a>
    </div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script type="text/javascript">
    // 刷新验证码
    function refreshCaptcha() {
        $('#captcha-img').attr('src', '/captcha?' + Math.random());
    }

    // 表单提交时，验证表单数据
    $('#register-form').submit(function () {
        var uname = $('#uname').val();
        var password = $('#password').val();
        var rights = $('#rights').val();
        var captcha = $('#captcha').val();

        if (uname===undefined||uname==='') {
            alert('请输入用户名');
            return false;
        }

        if (password===undefined||password==='') {
            alert('请输入密码');
            return false;
        }
        if (captcha===undefined||captcha==='') {
            alert('请输入验证码');
            return false;
        }
    });

    // 页面加载时，获取验证码
    $(function() {
        refreshCaptcha();
    });
</script>
</body>
</html>