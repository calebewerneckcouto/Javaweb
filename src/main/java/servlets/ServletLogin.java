package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOCadastroGeral;
import dao.DAOLoginRepository;
import dao.DAOUsuarioRepository;
import model.ModelCadastroGeral;
import model.ModelLogin;


/*O chamando Controller sao as servlets ou ServletLoginController*/
@WebServlet(urlPatterns = {"/principal/ServletLogin", "/ServletLogin"}) /*Mapeamento de URL que vem da tela*/
public class ServletLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private DAOLoginRepository daoLoginRepository = new DAOLoginRepository();
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();

  
    public ServletLogin() {
    }


    /*Recebe os dados pela url em parametros*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 String acao = request.getParameter("acao");
		 
		 if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
			 request.getSession().invalidate();// invalida a sessao
			 RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
			 redirecionar.forward(request, response);
		 }else {
		  doPost(request, response);
		 }
		 
	}

	
	/*recebe os dados enviados por um formulario*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String url = request.getParameter("url");
		
		try {
		
				if (login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {
					
					ModelLogin modelLogin = new ModelLogin();
					Long id = null;
					modelLogin.setId(id);
					modelLogin.setLogin(login);
					modelLogin.setSenha(senha);
					
					if (daoLoginRepository.validarAutenticacao(modelLogin)) { /*Simulando login*/
						
						
						
						
						
						
						
						modelLogin = daoUsuarioRepository.consultaUsuarioLogado(login);
						
						  request.getSession().setAttribute("usuarioid", modelLogin.getId());
						  
						  Long iduser = modelLogin.getId();
						String iduser1 = String.valueOf(iduser); 
						
						
						  
						 
						  
						DAOCadastroGeral daoCadastroGeral = new DAOCadastroGeral();
						List<ModelCadastroGeral > usuariologadogeral = daoCadastroGeral.buscaridusuariologado(iduser1);
						
					     
						 request.getSession().setAttribute("usuariologadogeral", usuariologadogeral);
						 
						 
						 				
				       
						request.getSession().setAttribute("usuario", modelLogin.getLogin());
						request.getSession().setAttribute("permissao", modelLogin.getPermissao());
						
						if (usuariologadogeral.size()==0 )  {
							url = "principal/cadastrogeral.jsp";
						}else {
							
							url = "principal/principal.jsp";
						}
						
						RequestDispatcher redirecionar = request.getRequestDispatcher(url);
						redirecionar.forward(request, response);
						
					}else {
						RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
						request.setAttribute("msg", "Informe o login e senha corretamente!");
						redirecionar.forward(request, response);
					}
					
				}else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("principal/usuario.jsp");
					request.setAttribute("msg", "Informe o login e senha corretamente!");
					redirecionar.forward(request, response);
				}
		
		}catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
	}

}
