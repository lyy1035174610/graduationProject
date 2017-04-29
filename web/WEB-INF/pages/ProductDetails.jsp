<%--
  Created by IntelliJ IDEA.
  User: YingyuLi
  Date: 2017/3/25
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Save Product</title>
</head>
<body>
<div id="global">
    <h4>The product has been saved.</h4>
    <p>
        <h5>Details</h5>
        Product Name:${product.name}<br/>
        Product Description:${product.description}<br/>
        Product Price:$${product.price}
    </p>
</div>
</body>
</html>
