<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>我的购物车</title>
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
    </style>
</head>
<body>
<div class="container">
    <h1>我的购物车</h1>
    <div class="cart">
        <span>购物车</span>
        <button>结算</button>
    </div>
    <table>
        <thead>
        <tr>
            <th>店铺ID</th>
            <th>封面图</th>
            <th>数量</th>
            <th>单价</th>
            <th>总价</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
<c:forEach var="goods" items="${list1}">
    <tr>
        <td>${goods.uid}</td>
        <td>
            <img src="${pageContext.request.contextPath}/statics/img/${goods.image}" height="100" alt="${goods.gname}的封面图"/>
        </td>
        <td>${goods.cart}</td>
        <td>${goods.price}</td>
        <td>${goods.cart}*${goods.price}</td>
        <td>
            <input type="checkbox" name="select" value="1">
            <button>删除</button>
        </td>
    </tr>
</c:forEach>
    <tr>
        <td colspan="4" class="total">总价：</td>
        <td class="total"></td>
        <td></td>
    </tr>
    </tbody>
</table>
<script type="text/javascript">
    var checkboxes = document.getElementsByName("select");
    var total = document.querySelector(".total");
    var rows = document.getElementsByTagName("tr");
    var selectedRows = [];

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener("change", function() {
            if (this.checked) {
                selectedRows.push(this.parentNode.parentNode);
            } else {
                selectedRows.splice(selectedRows.indexOf(this.parentNode.parentNode), 1);
            }
            updateTotal();
        });
    }

    function updateTotal() {
        var sum = 0;
        for (var i = 0; i < selectedRows.length; i++) {
            sum += parseFloat(selectedRows[i].querySelectorAll("td")[5].textContent);
        }
        total.textContent = "总价：" + sum.toFixed(2);
    }
</script>
</div>
</body>
</html>