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
        a {
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>我的购物车</h1>
    <button ><a href="${pageContext.request.contextPath}/queryGoods">返回</a> </button>
    <div class="cart">
        <span>购物车</span>
        <form action="${pageContext.request.contextPath}/goPay" method="post">
            <input type="hidden" name="selectedRows" id="selectedRows">
            <button type="submit">结算</button>
        </form>
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
            <th hidden></th>
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
        <td>${goods.cart * goods.price}</td>
        <td>
            <input type="checkbox" name="select" value="1">
            <button type="submit" onclick="updateCartByGid(${goods.gid})">删除</button>
        </td>
        <td hidden>${goods.gid}</td>
    </tr>
</c:forEach>
    <tr>
        <td colspan="5" class="total">总价：</td>
        <td>
            <input type="checkbox" id="selectAll">全选
        </td>
    </tr>
    </tbody>
</table>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
    var selectAll = document.getElementById("selectAll");
    var checkboxes = document.getElementsByName("select");
    var total = document.querySelector(".total");
    var rows = document.getElementsByTagName("tr");
    var selectedRows = [];
    // 点击结算按钮时，将勾选的行的信息存储到隐藏的input中
    var form = document.querySelector("form");
    form.addEventListener("submit", function() {
        var selectedRowsInput = document.getElementById("selectedRows");
        var selectedRowsData = [];
        for (var i = 0; i < selectedRows.length; i++) {
            var row = selectedRows[i];
            var gid = row.querySelector("td:nth-child(7)").textContent;
            var uid = row.querySelector("td:nth-child(1)").textContent;
            var count = row.querySelector("td:nth-child(3)").textContent;
            var price = row.querySelector("td:nth-child(5)").textContent;
            selectedRowsData.push(uid + "," + count + "," + price + "," + gid);
        }
        selectedRowsInput.value = selectedRowsData.join(";");
    });
    selectAll.addEventListener("change", function() {
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
            if (this.checked) {
                selectedRows.push(checkboxes[i].parentNode.parentNode);
            } else {
                selectedRows.splice(selectedRows.indexOf(checkboxes[i].parentNode.parentNode), 1);
            }
        }
        updateTotal();
    });
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
            sum += parseFloat(selectedRows[i].querySelectorAll("td")[4].textContent);
        }
        total.textContent = "总价：" + sum.toFixed(2);
    }

    function updateCartByGid(gid) {
        // 发送ajax请求，将gid作为参数传递给对应的controller
        $.ajax({
            url: "${pageContext.request.contextPath}/removeCart/"+gid,
            type: 'POST',
            success: function() {
                // 处理返回的数据
                alert("删除成功");
                location.reload();
            },
            error:function(){
                alert('删除失败');
            }
        });
    }
</script>
</div>
</body>
</html>