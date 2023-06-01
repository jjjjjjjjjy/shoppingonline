<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            height: 600px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .buttons {
            display: flex;
            align-items: center;
        }

        #cart {
            margin-left: 5px;
            margin-right: 20px;
        }

        .good-description {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #image {
            width: 400px;
            height: 400px;
            margin-right: 50px;
        }

        .info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        #gname {
            font-size: 36px;
            margin-bottom: 20px;
        }

        p {
            font-size: 24px;
            margin-bottom: 10px;
        }

        #addToCart {
            margin-top: 20px;
        }

        .a1 {
            text-decoration: none;
            color: white;
        }
    </style>
    <meta charset="UTF-8">
    <title>${GoodDescription.gname} - YTWO-SHOP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
</head>

<body>
<div class="container">
    <div class="header">
        <div class="buttons">
            <button id="return"><a href="javascript:history.go(-1)" class="a1">返回</a></button>
        </div>
        <div class="buttons">
            <img src="${pageContext.request.contextPath}/statics/img/logo.png" width="80px" height="80px">
            <h1>YTWO-SHOP</h1>
        </div>

        <div class="buttons">
            <button id="cart"><a href="${pageContext.request.contextPath}/MyCart" class="a1">我的购物车</a></button>
            <img src="${pageContext.request.contextPath}/statics/img/cart.png" height="60px" width="60px">
        </div>
    </div>
    <div class="good-description">
        <img id="image" src="${pageContext.request.contextPath}/statics/img/${GoodDescription.image}" alt="${GoodDescription.gname}的封面图">
        <div class="info">
            <h1 id="gname">${GoodDescription.gname}</h1>
            <p>库存：<span id="amount">${GoodDescription.amount}</span></p>
            <p>价格：<span id="price">${GoodDescription.price}</span></p>
            <button id="addToCart" onclick="addToCart()"><a href="${pageContext.request.contextPath}/addCart?gid=${GoodDescription.gid}" class="a1">加入购物车</a></button>
        </div>
    </div>
</div>
<script>
    function addToCart(){
        alert("添加成功");
    }
</script>
</body>
</html>