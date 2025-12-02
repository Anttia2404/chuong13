package murach.admin;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import murach.business.User;
import murach.data.UserDB;

@WebServlet("/admin/users")
public class UsersServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "/admin/index.jsp";
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "display_users";
        }

        if (action.equals("display_users")) {
            // Get all users from database
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);
            url = "/admin/index.jsp";
        } 
        else if (action.equals("display_user")) {
            // Get single user by email
            String email = request.getParameter("email");
            User user = UserDB.selectUser(email);
            request.setAttribute("user", user);
            url = "/admin/user.jsp";
        }
        else if (action.equals("update_user")) {
            // Update user in database
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String source = request.getParameter("source");
            String[] offers = request.getParameterValues("offers");
            String contactMethod = request.getParameter("contact_method");
            
            User user = new User(firstName, lastName, email, dateOfBirth,
                               source, offers, contactMethod);
            UserDB.update(user);
            
            // Redirect to display all users
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);
            url = "/admin/index.jsp";
        }
        else if (action.equals("delete_user")) {
            // Delete user from database
            String email = request.getParameter("email");
            User user = UserDB.selectUser(email);
            if (user != null) {
                UserDB.delete(user);
            }
            
            // Redirect to display all users
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);
            url = "/admin/index.jsp";
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
