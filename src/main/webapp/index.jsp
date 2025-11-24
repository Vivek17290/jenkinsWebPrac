<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Online Store - Home</title>
<style>
    body { font-family: Arial; margin:0; padding:0; background:#f2f2f2; }
    .navbar {
        background:#1e90ff; color:white; padding:15px;
        display:flex; justify-content:space-between; align-items:center;
    }
    .navbar a { color:white; text-decoration:none; margin:0 15px; }
    .banner {
        background:url('https://via.placeholder.com/1200x300') no-repeat center;
        height:300px;
        background-size:cover;
    }
    .content { padding:20px; }
    .btn {
        padding:10px 18px; background:#1e90ff; color:white;
        border:none; border-radius:5px; cursor:pointer;
    }
</style>
</head>
<body>

<div class="navbar">
    <div style="font-size:22px;font-weight:bold;">E-Commerce</div>
    <div>
        <a href="home">Home</a>
        <a href="product?action=list">Products</a>
        <a href="product?action=add">Add Product</a>
    </div>
</div>

<div class="banner"></div>

<div class="content">
    <h2>Welcome to Our Online Shopping Store</h2>
    <p>Browse products, manage items, and experience a simple shopping workflow.</p>

    <a href="product?action=list">
        <button class="btn">Shop Now</button>
    </a>
</div>

</body>
</html>
