<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>我的订单页面</title>
    <link rel="icon" href="${pageContext.request.contextPath}/statics/img/favicon.ico" mce_href="${pageContext.request.contextPath}/statics/img/favicon.ico" type="image/x-icon"/>
    <style>
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #ff5500;
            margin-bottom: 20px;
        }

        .cart span {
            font-size: 24px;
            color: #ff5500;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #ff8533;
            color: #fff;
        }

        img {
            height: 100px;
            width: 100px;
        }

        input[type="number"] {
            width: 50px;
            text-align: center;
            border: none;
            border-radius: 5px;
            background-color: #f5f5f5;
        }

        input[type="checkbox"] {
            margin-right: 10px;
        }
        button {
            background-color: #ff3500;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #ff6347;
        }

        a {
            text-decoration: none;
            color: #fff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body class="container">
    <h1>我的订单</h1>

    <div style="margin-bottom: 20px;">
        <button ><a href="${pageContext.request.contextPath}/queryGoods">返回</a> </button>
        <button ><a href="${pageContext.request.contextPath}/goMyOrder">全部订单</a> </button>
        <button ><a href="${pageContext.request.contextPath}/goMyOrder?situation=未发货">未发货订单</a> </button>
        <button ><a href="${pageContext.request.contextPath}/goMyOrder?situation=已发货">已发货订单</a> </button>
        <button ><a href="${pageContext.request.contextPath}/goMyOrder?situation=已收货">历史订单</a> </button>
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
            <th>收获地址</th>
            <th>状态</th>
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
                <td>${order.address}</td>
                <td>
                    <c:if test="${order.situation=='未发货'}">
                        待发货
                    </c:if>
                    <c:if test="${order.situation=='已发货'}">
                        <button onclick="delivery('${order.oid}')">确认收货</button>
                    </c:if>
                    <c:if test="${order.situation=='已收货'}">
                        订单已完成
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.6.4.js"></script>
        <script>
            function delivery(oid) {
                window.location.href = "${pageContext.request.contextPath}/delivery?oid=" + oid;
                alert("收货成功");
                location.reload();
            }
        </script>
        </tbody>
    </table>
</body>
</html>