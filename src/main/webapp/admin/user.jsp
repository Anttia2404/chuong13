<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
</head>
<body>
    <div class="container">
        <h1>Update User</h1>
        
        <form action="users" method="post">
            <input type="hidden" name="action" value="update_user">
            
            <fieldset>
                <legend>User Information</legend>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${user.email}" readonly>
                    <small>Email cannot be changed (primary key)</small>
                </div>

                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>
                </div>
                
                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="date" id="dob" name="dateOfBirth" value="${user.dateOfBirth}">
                </div>
            </fieldset>

            <fieldset>
                <legend>How did you hear about us?</legend>
                <div class="radio-group">
                    <input type="radio" id="source_search" name="source" value="search" ${user.source == 'search' ? 'checked' : ''}>
                    <label for="source_search">Search engine</label>
                </div>
                <div class="radio-group">
                    <input type="radio" id="source_word" name="source" value="word_of_mouth" ${user.source == 'word_of_mouth' ? 'checked' : ''}>
                    <label for="source_word">Word of mouth</label>
                </div>
                <div class="radio-group">
                    <input type="radio" id="source_social" name="source" value="social_media" ${user.source == 'social_media' ? 'checked' : ''}>
                    <label for="source_social">Social media</label>
                </div>
                <div class="radio-group">
                    <input type="radio" id="source_other" name="source" value="other" ${user.source == 'other' ? 'checked' : ''}>
                    <label for="source_other">Other</label>
                </div>
            </fieldset>

            <fieldset>
                <legend>Would you like to receive announcements?</legend>
                <c:set var="cdsChecked" value="" />
                <c:set var="emailsChecked" value="" />
                <c:forEach var="offer" items="${user.offers}">
                    <c:if test="${offer == 'cds'}">
                        <c:set var="cdsChecked" value="checked" />
                    </c:if>
                    <c:if test="${offer == 'emails'}">
                        <c:set var="emailsChecked" value="checked" />
                    </c:if>
                </c:forEach>
                <div class="checkbox-group">
                    <input type="checkbox" id="offers_cds" name="offers" value="cds" ${cdsChecked}>
                    <label for="offers_cds">Yes, I'd like announcements about new CDs</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="offers_emails" name="offers" value="emails" ${emailsChecked}>
                    <label for="offers_emails">Yes, please send me email announcements</label>
                </div>
            </fieldset>

            <fieldset>
                <legend>Please contact me by:</legend>
                <div class="form-group">
                    <select id="contact_method" name="contact_method">
                        <option value="">-- Select a contact method --</option>
                        <option value="email_or_post" ${user.contactMethod == 'email_or_post' ? 'selected' : ''}>Email or postal mail</option>
                        <option value="email" ${user.contactMethod == 'email' ? 'selected' : ''}>Email only</option>
                        <option value="postal" ${user.contactMethod == 'postal' ? 'selected' : ''}>Postal mail only</option>
                    </select>
                </div>
            </fieldset>
            
            <input type="submit" value="Update User">
            <a href="users?action=display_users" style="margin-left: 10px;">Cancel</a>
        </form>
    </div>
</body>
</html>
