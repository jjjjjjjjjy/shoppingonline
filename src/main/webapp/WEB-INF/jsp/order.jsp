<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>结算页面</title>
    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            font-size: 36px;
            margin: 0;
            padding: 20px 0;
            text-align: center;
        }
        .cart {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .cart span {
            font-size: 24px;
            font-weight: bold;
        }
        .cart button {
            font-size: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #ff6600;
            color: #fff;
            cursor: pointer;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .total {
            font-weight: bold;
            text-align: right;
            padding-right: 10px;
        }
        .selected {
            color: green;
            font-weight: bold;
        }
        input[type="checkbox"] {
            margin-right: 10px;
        }
        button {
            font-size: 14px;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            background-color: #ddd;
            color: #333;
            cursor: pointer;
        }
        button:hover {
            background-color: #ccc;
        }
        a {
            text-decoration: none;
            color: #333;
        }
        .topay {
            font-size: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #ff6600;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>
<form class="container" action="${pageContext.request.contextPath}/addOrder">
    <h1>我的订单</h1>
    <button ><a href="${pageContext.request.contextPath}/MyCart">返回</a> </button>
    <div class="cart">
        <span>商品清单</span>
    </div>
    <div>收货地址:
        <input type="text" name="address" placeholder="请输入您的收获地址">
    </div>
    <table>
        <thead>
        <tr>
            <th>店铺ID</th>
            <th>封面图</th>
            <th>数量</th>
            <th>单价</th>
            <th>总价</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="goods" items="${list2}">
            <tr>
                <td>${goods.uid}</td>
                <td>
                    <img src="${pageContext.request.contextPath}/statics/img/${goods.image}" height="100" alt="${goods.gname}的封面图"/>
                </td>
                <td>${goods.cart}</td>
                <td>${goods.price}</td>
                <td>${goods.cart * goods.price}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="5" class="total">总价：${TOTAL}  <button class="topay" onclick="pay()" type="submit">立即支付</button></td>
        </tr>
        </tbody>
    </table>
</form>
<script>
    function pay() {
        var address = document.getElementsByName("address")[0].value;
        if (address == "") {
            alert("请填写收货地址！");
            return false;
        }
        alert("支付成功！");
    }
</script>
</body>
</html>