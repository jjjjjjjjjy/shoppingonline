<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YTWO-SHOP-正品低价、品质保障、配送及时、轻松购物！</title>
    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
    <style>
        #shop{
            position: absolute;
            top: 10%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .l1{
            float: left;
            color: cadetblue;
            font-size: medium;
            font-family: "Microsoft YaHei UI", serif;
            padding: 25px;
            justify-content: center;
        }
        .a1{
            text-decoration: none;
            color: #3e8e41;
            font-weight: bold;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
</head>
<body>
<div>
    <ul class="l1">
        <li>欢迎您：${USER_SESSION.uname}，您的商家编号为：${UID}</li>
        <li>点此<a href="${pageContext.request.contextPath}/user/goOut" class="a1">注销</a></li>
        <li><a href="${pageContext.request.contextPath}/OrderManage" class="a1">订单管理</a></li>
        <li><a href="${pageContext.request.contextPath}/toAddGood" class="a1">新增商品</a></li>
    </ul>
</div>
<div id="shop">
    <img src="${pageContext.request.contextPath}/statics/img/logo.png" width="60px" height="60px">YTWO-SHOP 商家小店<br>
</div>
<table class="table table-bordered table-striped mt-3">
    <thead>
    <tr>
        <th>商品编号</th>
        <th>封面图</th>
        <th>商品名</th>
        <th>数量</th>
        <th>价格</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="goods" items="${list}">
        <tr>
            <td>${goods.gid}</td>
            <td>
                <img src="${pageContext.request.contextPath}/statics/img/${goods.image}" height="100" alt="${goods.gname}的封面图"/>
            </td>
            <td>${goods.gname}</td>
            <td>${goods.amount}</td>
            <td>${goods.price}</td>
            <td>
                <a href="${pageContext.request.contextPath}/toUpdate?uid=${goods.uid}&gid=${goods.gid}" class="btn btn-primary">修改</a>
                <a href="${pageContext.request.contextPath}/deleteGood?uid=${goods.uid}&gid=${goods.gid}" class="btn btn-danger" onclick="return confirm('确认要删除吗？')">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.min.js"></script>
</body>
</html>