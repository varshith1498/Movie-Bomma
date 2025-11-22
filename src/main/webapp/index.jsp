<%@ page import="java.util.List" %>
<%@ page import="com.example.hotstar.Video" %>
<%
    List<Video> videos = (List<Video>) request.getAttribute("videos");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotstar Clone</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #020617;
            color: #fff;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 40px;
            background: linear-gradient(to bottom, #020617, transparent);
            position: sticky;
            top: 0;
            z-index: 10;
        }
        .logo {
            font-weight: bold;
            font-size: 24px;
            color: #38bdf8;
        }
        .nav-links a {
            margin: 0 10px;
            text-decoration: none;
            color: #e5e7eb;
            font-size: 14px;
        }
        .hero {
            height: 320px;
            background: url("https://via.placeholder.com/1200x320?text=Hotstar+Banner") center/cover no-repeat;
            position: relative;
            display: flex;
            align-items: flex-end;
            padding: 30px 40px;
        }
        .hero h1 {
            font-size: 32px;
            margin-bottom: 8px;
        }
        .hero p {
            max-width: 500px;
            font-size: 14px;
            color: #e5e7eb;
        }
        .section-title {
            margin: 20px 40px 10px;
            font-size: 18px;
        }
        .card-row {
            display: flex;
            gap: 16px;
            padding: 0 40px 40px;
            overflow-x: auto;
        }
        .card {
            min-width: 250px;
            background: #020617;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.6);
        }
        .card img {
            width: 100%;
            display: block;
        }
        .card-body {
            padding: 10px 12px 14px;
        }
        .card-title {
            font-size: 16px;
            margin-bottom: 4px;
        }
        .card-category {
            font-size: 12px;
            color: #9ca3af;
            margin-bottom: 6px;
        }
        .card-desc {
            font-size: 13px;
            color: #d1d5db;
            height: 36px;
            overflow: hidden;
        }
        .watch-btn {
            margin-top: 10px;
            padding: 6px 12px;
            border-radius: 999px;
            border: none;
            background: #38bdf8;
            color: #0f172a;
            font-weight: bold;
            cursor: pointer;
            font-size: 12px;
        }
        .watch-btn:hover {
            background: #0ea5e9;
        }
    </style>
</head>
<body>
<header>
    <div class="logo">HotstarLite</div>
    <nav class="nav-links">
        <a href="#">Home</a>
        <a href="#">TV</a>
        <a href="#">Movies</a>
        <a href="#">Sports</a>
        <a href="#">Kids</a>
    </nav>
</header>

<section class="hero">
    <div>
        <h1>Watch your favourite shows & movies</h1>
        <p>Sample Hotstar-like UI built in Java (Servlet + JSP). Click on any card to start watching a demo video.</p>
    </div>
</section>

<h2 class="section-title">Trending Now</h2>
<div class="card-row">
    <%
        if (videos != null) {
            for (Video v : videos) {
    %>
    <div class="card">
        <img src="<%= v.getThumbnailUrl() %>" alt="<%= v.getTitle() %>">
        <div class="card-body">
            <div class="card-title"><%= v.getTitle() %></div>
            <div class="card-category"><%= v.getCategory() %></div>
            <div class="card-desc"><%= v.getDescription() %></div>
            <form action="watch" method="get">
                <input type="hidden" name="id" value="<%= v.getId() %>">
                <button class="watch-btn" type="submit">Watch Now</button>
            </form>
        </div>
    </div>
    <%
            }
        }
    %>
</div>

</body>
</html>
