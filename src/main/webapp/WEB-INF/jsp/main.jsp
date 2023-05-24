<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YTWO-SHOP-正品低价、品质保障、配送及时、轻松购物！</title>
    <meta name="description"
          content="YTWO-SHOP-专业的综合网上购物商城，为您提供正品低价的购物选择、优质便捷的服务体验。商品来自全球数十万品牌商家，囊括家电、手机、电脑、服装、居家、母婴、美妆、个护、食品、生鲜等丰富品类，满足各种购物需求。"/>
    <meta name="Keywords" content="网上购物,网上商城,家电,手机,电脑,服装,居家,母婴,美妆,个护,食品,生鲜"/>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
    <style>
        #shop{
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #f8f9fa;
        }
        #shop img{
            margin-right: 10px;
        }
        #search{
            width: 300px;
            height: 30px;
            border-radius: 5px;
            border: none;
            padding: 5px;
            margin-right: 10px;
        }
        #search:focus{
            outline: none;
        }
        #search-btn{
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
        }
        #search-btn:hover{
            background-color: #0069d9;
        }
        #cart{
            display: flex;
            align-items: center;
        }
        #cart img{
            margin-left: 10px;
        }
        #user{
            display: flex;
            align-items: center;
        }
        #user li{
            margin-right: 20px;
        }
        .a1{
            text-decoration: none;
            color: #3e8e41;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div id="shop">
    <div>
        <img src="${pageContext.request.contextPath}/statics/img/logo.png" width="60px" height="60px">
        <h1>YTWO-SHOP</h1>
    </div>
    <div>
        <form action="${pageContext.request.contextPath}/queryGoodsByName">
            <input type="text" id="search" name="search" placeholder="请输入商品名称">
            <input type="submit" value="搜索" id="search-btn">
        </form>
        <div id="cart">
            <a href="${pageContext.request.contextPath}/MyCart">我的购物车</a>
            <img src="${pageContext.request.contextPath}/statics/img/cart.png" height="60px" width="60px">
        </div>
    </div>
</div>
<div id="user">
    <ul>
        <li>欢迎您：${USER_SESSION.uname}，您的用户编号为：${USER_SESSION.uid}</li>
        <li><a href="${pageContext.request.contextPath}/goOut" class="a1">注销</a></li>
        <li><a href="#" class="a1">我的订单</a></li>
    </ul>
</div>
<table class="table table-bordered table-striped mt-3">
    <!-- 表格内容 -->
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
    <c:forEach var="goods" items="${List}">
        <tr>
            <td>${goods.gid}</td>
            <td>
                <img src="${pageContext.request.contextPath}/statics/img/${goods.image}" height="100" alt="${goods.gname}的封面图"/>
            </td>
            <td>${goods.gname}</td>
            <td>${goods.amount}</td>
            <td>${goods.price}</td>
            <td>
                <a href="${pageContext.request.contextPath}/addCart?gid=${goods.gid}" class="btn btn-primary">加入购物车</a>
                <a href="#" class="btn btn-danger">立即购买</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>