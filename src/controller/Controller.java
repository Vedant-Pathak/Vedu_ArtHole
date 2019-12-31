package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DataSource ds; 
    private Map<String,String> actionMap = new HashMap<>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        actionMap.put("image", "/image.jsp");
        actionMap.put("rate" , "/image.jsp");
        actionMap.put("home" , "/home.jsp");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    public void init() throws ServletException {
		// TODO Auto-generated method stub
		//super.init();
		try {
			InitialContext initContext = new InitialContext();
			Context env = (Context)initContext.lookup("java:comp/env");
			ds = (DataSource)env.lookup("jdbc/webshop");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			throw new ServletException();
		}
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		/* use a map instead for cleaner code
		 * if(action == null)
		 * getServletContext().getRequestDispatcher("/gallery").forward(request,response
		 * ); else if(action.equals(""))
		 */
		if(action == null || !actionMap.containsKey(action))
			action = "home";
		getServletContext().getRequestDispatcher(actionMap.get(action)).forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
