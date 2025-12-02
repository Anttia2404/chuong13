<%@ page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>500 - Lỗi Server</title>
    <link rel="stylesheet" href="styles/error_404.css">
    <link rel="stylesheet" href="styles/error_java.css">
</head>
<body>

    <p class="message">Rất tiếc, đã có lỗi xảy ra 🛠️</p>

    <a href="emailList" class="home-link">
        Quay về trang chủ
    </a>

    <div class="error-details">
        <h2>Chi tiết lỗi (Dành cho Debug):</h2>
        <p>
            <strong>Loại (Type):</strong> ${pageContext.exception["class"]}
        </p>
        <p>
            <strong>Thông báo (Message):</strong> ${pageContext.exception.message}
        </p>
    </div>

</body>
</html>
