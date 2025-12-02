package murach.email;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/test")
public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>Test Servlet</title></head><body>");
            out.println("<h1>TestServlet Get</h1>");
            out.println("<p>Servlet này đã chạy thành công bằng phương thức GET.</p>");
            out.println("</body></html>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>Test Servlet</title></head><body>");
            out.println("<h1>TestServlet Post</h1>");
            out.println("<p>Servlet này đã chạy thành công bằng phương thức POST.</p>");
            out.println("</body></html>");
        } finally {
            out.close();
        }
    }
}
