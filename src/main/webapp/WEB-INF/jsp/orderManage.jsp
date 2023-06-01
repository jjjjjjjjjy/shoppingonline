<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>订单管理页面</title>
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
<h1>订单管理</h1>
<button ><a href="${pageContext.request.contextPath}/allGoods">返回</a> </button>
<button ><a href="${pageContext.request.contextPath}/OrderManage">所有订单</a> </button>
<button ><a href="${pageContext.request.contextPath}/unshipped">未发货订单</a> </button>
<table>
    <thead>
    <tr>
        <th>订单编号</th>
        <th>商品名</th>
        <th>商品封面图</th>
        <th>数量</th>
        <th>总价</th>
        <th>用户ID</th>
        <th>收获地址</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${OrderManage}">
        <tr>
            <td>${order.oid}</td>
            <td>${UserService.queryGoodById(order.uid,order.gid).gname}</td>
            <td>
                <img src="${pageContext.request.contextPath}/statics/img/${UserService.queryGoodById(order.uid,order.gid).image}" height="100" alt="${UserService.queryGoodById(order.uid,order.gid).gname}的封面图"/>
            </td>
            <td>${order.amount}</td>
            <td>${order.price}</td>
            <td>${order.consumer}</td>
            <td>${order.address}</td>
            <td>
                <c:if test="${order.situation=='未发货'}">
                    <button onclick="deliver('${order.oid}')">发货</button>
                </c:if>
                <c:if test="${order.situation=='已发货'}">
                    未收货
                </c:if>
                <c:if test="${order.situation=='已收货'}">
                    订单已完成
                </c:if>
            </td>
        </tr>
    </c:forEach>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.6.4.js"></script>
    <script>
        function deliver(oid) {
            window.location.href = "/deliver?oid=" + oid;
            alert("发货成功");
            location.reload();
        }
    </script>
    </tbody>
</table>
</body>
</html>