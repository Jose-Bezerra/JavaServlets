package br.com.alura.gerenciador.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.alura.gerenciador.modelo.Banco;
import br.com.alura.gerenciador.modelo.Empresa;


@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Recebendo os parâmetros
		String nomeEmpresa = request.getParameter("nome");
		String paramData = request.getParameter("data");
		
		//Acima recebemos a data em formato de String, por isso precisamos fazer
		//o parse
		
		Date dataAbertura;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    dataAbertura = sdf.parse(paramData);
		} catch (ParseException e) {
			throw new ServletException(e);
		}		
		
		//Atribuimos o 'nomeEmpresa' como argumento do setNome
		Empresa empresa = new Empresa();
		empresa.setNome(nomeEmpresa);
		empresa.setDataAbertura(dataAbertura);
		
		//O modelo banco registrará a empresa criada
		Banco banco = new Banco();
		banco.adiciona(empresa);
		
		System.out.println("Cadastrando nova empresa!");
		
		//Vamos conectar este Servlet ao JSP (Java Server Page) correspondente.
		request.setAttribute("empresa", empresa.getNome());
//		RequestDispatcher rd = request.getRequestDispatcher("/listaEmpresas");
//		rd.forward(request, response);
		
		//O trecho acima foi comentado porque agora este Servlet devolverá uma resposta para o navegador não utilizando mais o despachador.
		
		response.sendRedirect("listaEmpresas");
		
			
	
	}

}
