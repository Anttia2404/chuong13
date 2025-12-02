<jsp:include page="includes/header.jsp" />

        <h1>Thanks for joining our email list</h1>
        <p>Here is the information that you entered:</p>

        <label>Email:</label>
        <span>${user.email}</span><br>

        <label>First Name:</label>
        <span>${user.firstName}</span><br>

        <label>Last Name:</label>
        <span>${user.lastName}</span><br>
        
        <label>Date of Birth:</label>
        <span>${user.dateOfBirth}</span><br>

        <label>How you heard:</label>
        <span>
            <c:choose>
                <c:when test="${user.source == 'search'}">Search engine</c:when>
                <c:when test="${user.source == 'word_of_mouth'}">Word of mouth</c:when>
                <c:when test="${user.source == 'social_media'}">Social media</c:when>
                <c:when test="${user.source == 'other'}">Other</c:when>
                <c:otherwise>N/A</c:otherwise>
            </c:choose>
        </span><br>

        <label>Contact method:</label>
        <span>
            <c:choose>
                <c:when test="${user.contactMethod == 'email'}">Email only</c:when>
                <c:when test="${user.contactMethod == 'postal'}">Postal mail only</c:when>
                <c:when test="${user.contactMethod == 'email_or_post'}">Email or postal mail</c:when>
                <c:otherwise>N/A</c:otherwise>
            </c:choose>
        </span><br>

        <label>Announcements:</label>
        <span>
            <ul class="offer-list">
                <c:forEach var="offer" items="${user.offers}">
                    <li>
                        <c:choose>
                            <c:when test="${offer == 'cds'}">Yes, announcements about new CDs</c:when>
                            <c:when test="${offer == 'emails'}">Yes, email announcements</c:when>
                        </c:choose>
                    </li>
                </c:forEach>
                <c:if test="${empty user.offers}">
                    <li>No announcements selected.</li>
                </c:if>
            </ul>
        </span><br>

        <p class="advice">To enter another email address, click on the Return button.</p>
        <p style="text-align: center; font-style: italic; font-size: 10pt;">
            Lien he quan tri vien: ${initParam.adminName}
        </p>
        <form action="emailList" method="get">
            <input type="hidden" name="action" value="join">
            <input type="submit" value="Return">
        </form>
    <jsp:include page="includes/footer.jsp" />
