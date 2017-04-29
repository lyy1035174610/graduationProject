<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/3/25
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProductForm</title>
</head>
<body>
    <div id="global">
        <form action="product_save.action" method="post">
            <fieldset>
                <legend>Add a product</legend>
                <label for="name">product name:</label>
                <input type="text" id="name" name="name" value="" tabindex="1">
                <label for="description">product description:</label>
                <input type="text" id="description" name="description" value="" tabindex="2">
                <label for="price">product price:</label>
                <input type="text" id="price" name="price" value="" tabindex="2">
                <div id="buttons">
                    <input id="reset" type="reset" tabindex="4">
                    <input id="submit" type="submit" tabindex="5" value="Add Product">
                </div>
            </fieldset>
        </form>
    </div>
</body>
</html>
