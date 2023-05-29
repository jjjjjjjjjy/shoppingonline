<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增商品</title>
    <style>
        .button1 {
            font-size: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #ff6600;
            color: #fff;
            cursor: pointer;
        }
        .a1 {
            text-decoration: none;
            color: #fff;
        }
    </style>
    <!-- 引入Bootstrap样式文件 -->
    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.4.js"></script>
</head>
<body>
<div class="container">
    <h1 class="text-center text-info mt-5">新增商品</h1>
    <button type="button" class="button1"><a class="a1" href="${pageContext.request.contextPath}/allGoods">返回</a></button>
    <form action="${pageContext.request.contextPath}/addGood" method="post" id="f1" enctype="multipart/form-data">
        <div class="form-group">
            <label for="file">封面图</label>
            <input type="file" class="form-control-file" id="file" name="file">
        </div>
        <div class="form-group">
            <label for="gname">商品名</label>
            <input type="text" class="form-control" id="gname" name="gname" required>
            <span id="remind"></span>
        </div>
        <div class="form-group">
            <label for="amount">库存数</label>
            <input type="text" class="form-control" id="amount" name="amount" required>
        </div>
        <div class="form-group">
            <label for="price">价格</label>
            <input type="text" class="form-control" id="price" name="price" required>
        </div>
        <div class="form-group">
            <label for="category">类别</label>
            <select id="category" name="category" class="form-control">
                <option value="服装鞋帽">服装鞋帽</option>
                <option value="数码家电">数码家电</option>
                <option value="美妆个护">美妆个护</option>
                <option value="家居生活">家居生活</option>
                <option value="食品饮料">食品饮料</option>
            </select>
        </div>
        <input type="hidden" id="uid" name="uid" value=${USER_SESSION.uid}>
        <button type="submit" class="btn btn-primary">添加</button>
    </form>
</div>
<!-- 引入jQuery和Bootstrap的JavaScript文件 -->
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.min.js"></script>
</body>
</html>