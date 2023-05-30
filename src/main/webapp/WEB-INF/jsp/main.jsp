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
<%--    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">--%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- jQuery -->
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/main.css">
    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
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
            <button class="addcart"><a href="${pageContext.request.contextPath}/MyCart">我的购物车</a></button>
            <img src="${pageContext.request.contextPath}/statics/img/cart.png" height="60px" width="60px">
        </div>
    </div>
</div>
<div id="user">
    <ul>
        <li>欢迎您：${USER_SESSION.uname}，您的用户编号为：${USER_SESSION.uid}</li>
        <li><a href="${pageContext.request.contextPath}/goOut" class="a1">注销</a></li>
        <li><a href="${pageContext.request.contextPath}/goMyOrder" class="a1">我的订单</a></li>
    </ul>
</div>
        <div class="nav-container">
            <ul class="nav">
                <li><a href="${pageContext.request.contextPath}/queryGoods">首页 <span>(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods">全部商品</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=服装鞋帽">服装鞋帽</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=数码家电">数码家电</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=美妆个护">美妆个护</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=食品饮料">食品饮料</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=家居生活">家居生活</a></li>
            </ul>
        </div>
    <c:forEach items="${List}" var="product">
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/statics/img/${product.image}" alt="${product.gname}" height="50" data-id="${product.gid}" onclick="gotoController(this)">
                <div class="caption">
                    <h4>${product.gname}</h4>
                </div>
            </div>
        </div>
    </c:forEach>
</body>
<script>
    function gotoController(img) {
        var gid = img.getAttribute('data-id'); // 获取商品编号
        location.href = '/goodDescription?gid=' + gid; // 跳转到controller，并传递商品编号
    }
</script>
</html>