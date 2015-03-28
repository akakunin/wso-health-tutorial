package org.wso2.sample;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.axis2.client.Options;
import org.apache.axis2.transport.http.HTTPConstants;
import org.apache.axis2.transport.http.HttpTransportProperties;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceStub;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
    private final String basicAuthUserID = "admin";
    private final String basicAuthPassword = "admin";
    private final String serverUrl = "https://localhost:9444/services/";
    private RemoteUserStoreManagerServiceStub stub = null;


    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
 
        // get request parameters for userID and password
        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");
        
        try {
			if(authenticate(user,pwd)){
			    HttpSession session = request.getSession();
			    session.setAttribute("user", user);
			    //setting session to expiry in 30 mins
			    session.setMaxInactiveInterval(30*60);
			    Cookie userName = new Cookie("user", user);
			    userName.setMaxAge(30*60);
			    response.addCookie(userName);
			    response.sendRedirect("landingPage.jsp");
			}else{
			    RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
			    PrintWriter out= response.getWriter();
			    out.println("<font color=red>Either user name or password is wrong.</font>");
			    rd.include(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
 
    }
    
    private boolean authenticate(String userName, Object credential) throws Exception {
        if (!(credential instanceof String)) {
            throw new Exception("Unsupported type of password");
        }
        try {
        	if(stub == null) {
        	    stub = new RemoteUserStoreManagerServiceStub(null, serverUrl
        	            + "RemoteUserStoreManagerService");
        	    HttpTransportProperties.Authenticator basicAuth = new HttpTransportProperties.Authenticator();
                basicAuth.setUsername(basicAuthUserID);
                basicAuth.setPassword(basicAuthPassword);
                basicAuth.setPreemptiveAuthentication(true);

                final Options clientOptions = stub._getServiceClient().getOptions();
                clientOptions.setProperty(HTTPConstants.AUTHENTICATE, basicAuth);
                stub._getServiceClient().setOptions(clientOptions);

        	}
            return stub.authenticate(userName, (String) credential);
        } catch (Exception e) {
            handleException(e.getMessage(), e);
        }
        return false;
    }
    
    
    private String[] handleException(String msg, Exception e) throws Exception {
        System.out.println(e.getMessage() + e);
        throw new Exception(msg, e);
    }

}
