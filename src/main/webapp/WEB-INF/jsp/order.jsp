<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>结算页面</title>
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
<body>
<form class="container" action="${pageContext.request.contextPath}/addOrder">
    <h1>我的订单</h1>
    <button ><a href="${pageContext.request.contextPath}/MyCart">返回</a> </button>
    <div class="cart">
        <span>商品清单</span>
    </div>
    <div>收货地址:
        <input type="text" name="address" placeholder="请输入您的收获地址" value="${Address}">
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
            <td colspan="5" class="total">总价：${TOTAL}  <button class="topay" onclick="pay(event)" type="submit">立即支付</button></td>
        </tr>
        </tbody>
    </table>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.6.4.js"></script>
<script>
    function pay(event) {

        var address = document.getElementsByName("address")[0].value;
        if (address === "") {
            event.preventDefault();
            alert("请填写收货地址！");
            return false;
        }
        alert("支付成功！");
    }
</script>
</body>
</html>