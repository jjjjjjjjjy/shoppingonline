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
    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
    <style>
        #shop{
            position: absolute;
            top: 20%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .l1{
            float: right;
        }
    </style>
</head>
<body>
<div>
    <ul>
        <li class="l1">
            <a href="${pageContext.request.contextPath}/user/goLogin" class="link-login">你好，请登录</a>&nbsp;&nbsp;
        </li>
    </ul>
</div>
<form action="${pageContext.request.contextPath}/queryGoods">
<div id="shop" >
    <div>
        <img src="${pageContext.request.contextPath}/statics/img/logo.png" width="60px" height="60px">YTWO-SHOP
    </div>
    <div>
        <input type="text" id="search">
        <input type="submit" value="搜索">
        <a href="#">我的购物车</a><img src="${pageContext.request.contextPath}/statics/img/cart.png" height="60px" width="60px">
    </div>
    <c:forEach items="${List}" var="product">
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="${product.image}" alt="${product.gname}">
                <div class="caption">
                    <h4>${product.gname}</h4>
                    <p><a href="#" class="btn btn-primary" role="button">查看详情</a></p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</form>
</body>
<%--</html>--%>
<%--<!--分类标签-->--%>
<%--<div id="category">--%>
<%--    <a href="#" class="category-item" data-category="1">家电</a>--%>
<%--    <a href="#" class="category-item" data-category="2">服装</a>--%>
<%--    <a href="#" class="category-item" data-category="3">美妆</a>--%>
<%--    <!--其他分类标签-->--%>
<%--</div>--%>

<%--<!--商品展示区域-->--%>
<%--<div id="product-list">--%>
<%--    <!--商品列表-->--%>
<%--</div>--%>

<%--<script>--%>
<%--    $(function() {--%>
<%--        //点击分类标签获取对应分类的商品信息--%>
<%--        $('#category').on('click', '.category-item', function() {--%>
<%--            var category = $(this).data('category');--%>
<%--            $.ajax({--%>
<%--                url: '/product/list',--%>
<%--                type: 'get',--%>
<%--                data: {category: category},--%>
<%--                success: function(data) {--%>
<%--                    //将获取到的商品信息展示在页面上--%>
<%--                    //...--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>