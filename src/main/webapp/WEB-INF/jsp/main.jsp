<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        #head1 {
            background-color: #ff6600;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo a {
            color: #fff;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav li {
            margin-left: 20px;
        }

        nav li:first-child {
            margin-left: 0;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }
        .m {
            height: 420px;
            width: 2000px;
            display: flex;
            justify-content: left;
        }
        .block1 {
            width: 600px;
            height: 400px;
            background-color: white;
            padding-right: 50px;
            padding-left: 50px;
        }
        .block2 {
            width: 480px;
            height: 400px;
            background-color: white;
            padding-right: 50px;
            padding-left: 50px;
        }
        .nav2 {
            height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .nav2 a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
            text-decoration: none;
            transition: all 0.2s ease-in-out;
        }

        .nav2 a:hover {
            color: #f40;
            background-color: #f5f5f5;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YTWO-SHOP-正品低价、品质保障、配送及时、轻松购物！</title>
    <meta name="description"
          content="YTWO-SHOP-专业的综合网上购物商城，为您提供正品低价的购物选择、优质便捷的服务体验。商品来自全球数十万品牌商家，囊括家电、手机、电脑、服装、居家、母婴、美妆、个护、食品、生鲜等丰富品类，满足各种购物需求。"/>
    <meta name="Keywords" content="网上购物,网上商城,家电,手机,电脑,服装,居家,母婴,美妆,个护,食品,生鲜"/>
<%--    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">--%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/main.css">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
</head>
<body>
<header id="head1">
    <div class="logo">
        <a href="#">Y-TWO SHOP 欢迎您</a>
    </div>
    <nav>
        <ul>
            <li>
                <form action="${pageContext.request.contextPath}/queryGoodsByName">
                    <input type="text" id="search" name="search" placeholder="请输入商品名称">
                    <input type="submit" value="搜索" id="search-btn">
                </form>
            </li>
            <li><a href="${pageContext.request.contextPath}/MyCart">购物车</a></li>
            <li><a href="${pageContext.request.contextPath}/goMyOrder">我的订单</a></li>
            <c:if test="${USER_SESSION != null}">
                <li><a href="${pageContext.request.contextPath}/user/goOut">退出登录</a></li>
            </c:if>
            <c:if test="${USER_SESSION == null}">
                <li><a href="${pageContext.request.contextPath}/user/goLogin">登录</a></li>
            </c:if>
        </ul>
    </nav>
</header>
<main class="m">
    <div class="block1" style="background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.2);">
        <img src="${pageContext.request.contextPath}/statics/img/logo.png" alt="logo" height="100px" style="display: block; margin: 0 auto;">
        <h3 style="text-align: center; margin-top: 20px; font-size: 24px; font-weight: bold;">正品低价、品质保障、配送及时、轻松购物！</h3>
        <p style="text-align: center; margin-top: 20px; font-size: 16px; line-height: 1.5;">YTWO-SHOP-专业的综合网上购物商城，为您提供正品低价的购物选择、优质便捷的服务体验。商品来自全球数十万品牌商家，囊括家电、手机、电脑、服装、居家、母婴、美妆、个护、食品、生鲜等丰富品类，满足各种购物需求。</p>
    </div>
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 400px;width: 400px">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>>
            <li data-target="#myCarousel" data-slide-to="1"></li>>
            <li data-target="#myCarousel" data-slide-to="2"></li>>
            <li data-target="#myCarousel" data-slide-to="3"></li>>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" id="container" style="height: 400px;width: 400px">
            <div class="item active">
                <img src="${pageContext.request.contextPath}/statics/img/j1.jpg?text=Slide+1" alt="Slide 1" data-id="${6}" onclick="gotoController(this)" height="100px">
            </div>

            <div class="item">
                <img src="${pageContext.request.contextPath}/statics/img/gg1.jpg?text=Slide+2" alt="Slide 2" data-id="${10}" onclick="gotoController(this)">
            </div>
            <div class="item">
                <img src="${pageContext.request.contextPath}/statics/img/g1.jpg?text=Slide+3" alt="Slide 3" data-id="${1}" onclick="gotoController(this)">
            </div>
            <div class="item">
                <img src="${pageContext.request.contextPath}/statics/img/j2.jpg?text=Slide+4" alt="Slide 4" data-id="${7}" onclick="gotoController(this)">
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
    <div class="block2" style="background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.2);">
        <div class="nav2">
            <ul>
                <li><a href="${pageContext.request.contextPath}/queryGoods">全部商品</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=食品饮料">食品/饮料</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=美妆个护">美妆/个护</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=服装鞋帽">鞋帽/服饰</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=家居生活">生活/家居</a></li>
                <li><a href="${pageContext.request.contextPath}/queryGoods?category=数码家电">数码/电器</a></li>
            </ul>
        </div>
    </div>
</main>
<div>
    <div class="nav-container1">
        <ul class="nav1">
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
</div>

</body>
<script>
    function gotoController(img) {
        var gid = img.getAttribute('data-id'); // 获取商品编号
        location.href = '/goodDescription?gid=' + gid; // 跳转到controller，并传递商品编号
    }
</script>
</html>