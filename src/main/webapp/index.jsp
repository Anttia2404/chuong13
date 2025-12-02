<jsp:include page="includes/header.jsp" />
        <p>If you have a moment, we'd appreciate it if you would fill out this survey.</p>
        <p class="error-message"><i>${message}</i></p>
        
        <form action="emailList" method="post">
            <input type="hidden" name="action" value="add">

            <fieldset>
                <legend>Your Information</legend>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${user.email}"> 
                </div>

                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" value="${user.firstName}"> 
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" value="${user.lastName}"> 
                </div>
                
                <div class="form-group">
                    <label for="dob">Date of birth:</label>
                    <input type="date" id="dob" name="dateOfBirth" placeholder="mm/dd/yyyy" value="${user.dateOfBirth}">
                </div>
            </fieldset>

            <fieldset>
                <legend>How did you hear about us?</legend>
                <div class="radio-group">
                    <input type="radio" id="source_search" name="source" value="search" required ${user.source == 'search' ? 'checked' : ''}>
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
                    <select id="contact_method" name="contact_method" required>
                        <option value="">-- Select a contact method --</option>
                        <option value="email_or_post" ${user.contactMethod == 'email_or_post' ? 'selected' : ''}>Email or postal mail</option>
                        <option value="email" ${user.contactMethod == 'email' ? 'selected' : ''}>Email only</option>
                        <option value="postal" ${user.contactMethod == 'postal' ? 'selected' : ''}>Postal mail only</option>
                    </select>
                </div>
            </fieldset>
            
            <input type="submit" value="Submit">
        </form>
    <jsp:include page="includes/footer.jsp" />
