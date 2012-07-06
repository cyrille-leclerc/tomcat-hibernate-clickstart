package jsp;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;

public class ItemController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ItemController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        ItemManager manager = ItemManagerFactory.getManager();

        try {
            if (request.getParameter("remove") != null) {
                String name = request.getParameter("removeName");
                manager.delete(name);

            } else if (request.getParameter("add") != null) {
                String name = request.getParameter("name");
                String comment = request.getParameter("comment");
                manager.add(name, comment);
            }

            List<Item> itemList = manager.getItems();
            StringBuilder sb = new StringBuilder();
            for (Item item : itemList) {
                sb.append("<div class=\"item\">\n<tr><td>");
                sb.append(item.getName());
                sb.append("</td><td>");
                sb.append(item.getComment());
                sb.append("</td></tr>\n</div>\n");
            }
            String out = sb.toString();
            request.setAttribute("items", out + ".\n");
            request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
        } catch (HibernateException e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        } 
    }
}
