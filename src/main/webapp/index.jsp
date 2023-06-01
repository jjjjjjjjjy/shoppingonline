<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YTWO-SHOP-正品低价、品质保障、配送及时、轻松购物！</title>
    <meta name="description"
          content="YTWO-SHOP-专业的综合网上购物商城，为您提供正品低价的购物选择、优质便捷的服务体验。商品来自全球数十万品牌商家，囊括家电、手机、电脑、服装、居家、母婴、美妆、个护、食品、生鲜等丰富品类，满足各种购物需求。"/>
    <meta name="Keywords" content="网上购物,网上商城,家电,手机,电脑,服装,居家,母婴,美妆,个护,食品,生鲜"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/index.css">
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
<header id="head">
    <div class="logo">
        <a href="#">Y-TWO SHOP 欢迎您</a>
    </div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/queryGoods">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/queryGoods">商品分类</a></li>
            <li><a href="${pageContext.request.contextPath}/MyCart">购物车</a></li>
            <li><a href="${pageContext.request.contextPath}/goMyOrder">我的订单</a></li>
            <c:if test="${USER_SESSION != null}">
                <li><a href="${pageContext.request.contextPath}/user/goOut">退出登录</a></li>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <li><a href="${pageContext.request.contextPath}/user/goLogin">登录</a></li>
            </c:if>
        </ul>
    </nav>
</header>
<main>

    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 500px">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>>
            <li data-target="#myCarousel" data-slide-to="1"></li>>
            <li data-target="#myCarousel" data-slide-to="2"></li>>
            <li data-target="#myCarousel" data-slide-to="3"></li>>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" id="container" style="height: 500px">
            <div class="item active">
                <img src="${pageContext.request.contextPath}/statics/img/header1.jpg?text=Slide+1" alt="Slide 1">
            </div>

            <div class="item">
                <img src="${pageContext.request.contextPath}/statics/img/header2.jpg?text=Slide+2" alt="Slide 2">
            </div>

            <div class="item">
                <img src="${pageContext.request.contextPath}/statics/img/header3.jpg?text=Slide+3" alt="Slide 3">
            </div>
            <div class="item">
                <img src="${pageContext.request.contextPath}/statics/img/header4.jpg?text=Slide+4" alt="Slide 4">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</main>
<footer>
    <p>版权所有 © Y-TWO SHOP</p>
</footer>
</body>
</html>