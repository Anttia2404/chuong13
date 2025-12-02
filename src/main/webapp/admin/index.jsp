<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
</head>
<body>
    <div class="container">
        <h1>User Admin</h1>
        
        <c:if test="${users == null || users.size() == 0}">
            <p>No users found in the database.</p>
            <p><a href="${pageContext.request.contextPath}/index.jsp">Add a user via Email List</a></p>
        </c:if>
        
        <c:if test="${users != null && users.size() > 0}">
            <table>
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Date of Birth</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.dateOfBirth}</td>
                            <td class="action-links">
                                <a href="users?action=display_user&email=${user.email}">Update</a>
                                <a href="users?action=delete_user&email=${user.email}" 
                                   class="delete-link"
                                   onclick="return confirm('Are you sure you want to delete ${user.firstName} ${user.lastName}?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <div class="advice">
            <p><a href="${pageContext.request.contextPath}/index.jsp">Back to Survey</a></p>
        </div>
    </div>
</body>
</html>
