package murach.email;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import murach.business.User;
import murach.data.UserDB;


@WebServlet("/emailList")
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException { //ngoai le
        
        String url = "/index.jsp"; 
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }

        if (action.equals("join")) {
            url = "/index.jsp";
        } 
        else if (action.equals("add")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String source = request.getParameter("source");
            String[] offers = request.getParameterValues("offers");
            String contactMethod = request.getParameter("contact_method");
            
            if (firstName.equals("error")) {
                throw new RuntimeException("Test lỗi Java từ servlet!");
            }
            
            
            System.out.println("Action: " + action);
            System.out.println("First Name: " + firstName);
            System.out.println("Last Name: " + lastName);
            System.out.println("Email: " + email);

            User user = new User(firstName, lastName, email, dateOfBirth, 
                                 source, offers, contactMethod);
            
            String message;
            
            if (firstName == null || firstName.isEmpty() ||
                lastName == null  || lastName.isEmpty() ||
                email == null     || email.isEmpty()) {
                
                message = "Please fill out all required fields: Email, First Name, and Last Name.";
                url = "/index.jsp";
            } 
            else {
                message = "";
                url = "/thanks.jsp";
                // Insert user into database using JPA
                UserDB.insert(user);
            }
            
            request.setAttribute("user", user);
            request.setAttribute("message", message);
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
