<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>我的订单页面</title>
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
    </style>
</head>
<body>
    <h1>我的订单</h1>
    <button ><a href="${pageContext.request.contextPath}/queryGoods">返回</a> </button>
    <div class="cart">
        <span>已购买</span>
    </div>
    <table>
        <thead>
        <tr>
            <th>店铺ID</th>
            <th>商品名</th>
            <th>封面图</th>
            <th>数量</th>
            <th>总价</th>
            <th>订单编号</th>
            <th>发货状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${MyOrder}">
            <tr>
                <td>${order.gid}</td>
                <td>${UserService.queryGoodById(order.uid,order.gid).gname}</td>
                <td>
                    <img src="${pageContext.request.contextPath}/statics/img/${UserService.queryGoodById(order.uid,order.gid).image}" height="100" alt="${UserService.queryGoodById(order.uid,order.gid).gname}的封面图"/>
                </td>
                <td>${order.amount}</td>
                <td>${order.price}</td>
                <td>${order.oid}</td>
                <td>${order.situation}</td>
            </tr>
        </c:forEach>
<%--        </c:forEach>--%>
        <tr>
            <td colspan="4">收货地址:${Address}</td>
        </tr>
        </tbody>
    </table>
</body>
</html>