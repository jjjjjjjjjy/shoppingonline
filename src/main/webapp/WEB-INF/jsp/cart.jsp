<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>购物车</title>
    <style type="text/css">
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
    </style>
</head>
<body>
<h1>购物车</h1>
<div>
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
    <tr>
        <td>001</td>
        <td><img src="cover1.jpg" width="50"></td>
        <td>2</td>
        <td>10.00</td>
        <td>20.00</td>
        <td>
            <input type="checkbox" name="select" value="1">
            <button>删除</button>
        </td>
    </tr>
    <tr>
        <td>002</td>
        <td><img src="cover2.jpg" width="50"></td>
        <td>1</td>
        <td>20.00</td>
        <td>20.00</td>
        <td>
            <input type="checkbox" name="select" value="2">
            <button>删除</button>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="total">总价：</td>
        <td class="total">40.00</td>
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
            sum += parseFloat(selectedRows[i].querySelectorAll("td")[4].textContent);
        }
        total.textContent = "总价：" + sum.toFixed(2);
    }
</script>
</body>
</html>