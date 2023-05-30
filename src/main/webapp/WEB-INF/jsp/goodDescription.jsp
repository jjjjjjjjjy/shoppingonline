<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${GoodDescription.gname} - YTWO-SHOP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
</head>

<body>
<div id="shop">
    <div>
        <img src="${pageContext.request.contextPath}/statics/img/logo.png" width="60px" height="60px">
        <h1>YTWO-SHOP</h1>
        <button id="return"><a href="javascript:history.go(-1)" class="a1">返回</a></button>
    </div>
    <div>
        <div>
            <button id="cart"><a href="${pageContext.request.contextPath}/MyCart" class="a1">我的购物车</a></button>
            <img src="${pageContext.request.contextPath}/statics/img/cart.png" height="60px" width="60px">
        </div>
    </div>
</div>

<div id="good-description">
    <img id="image" src="${pageContext.request.contextPath}/statics/img/${GoodDescription.image}" alt="${GoodDescription.gname}的封面图">
    <div id="info">
        <h1 id="gname">${GoodDescription.gname}</h1>
        <p>库存：<span id="amount">${GoodDescription.amount}</span></p>
        <p>价格：<span id="price">${GoodDescription.price}</span></p>
        <button id="addToCart" onclick="addToCart()"><a href="${pageContext.request.contextPath}/addCart?gid=${GoodDescription.gid}" class="a1">加入购物车</a></button>
    </div>
</div>
<script>
    function addToCart(){
        alert("添加成功");
    }
</script>
</body>
</html>