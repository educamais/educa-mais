package br.com.educamais.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.educamais.model.UsuarioDao;

@Controller
public class UsuarioController {

	//Rota para tela de login
	@RequestMapping("login")
	public String telaLogin() {
		return"telaLogin";
	}
	
	/* Rota para testa autenticação
	 * Recebe como parâmetro email e senha
	 * e um Model para enviar mensagem de erro para view
	*/
	@RequestMapping("autenticar")
	public String autenticar(@RequestParam("email") String email, @RequestParam("senha") String senha, Model model) {
		
		UsuarioDao dao = new UsuarioDao();
		
		/* Método boolean que verifica se o usuário pode autenticar
		 * Recebe o email e senha, se exitir algum registro correspondente
		 * o método retorna true e a autenticação é realizada
		*/
		if(dao.verificarExistencia(email, senha)) {
			return"logadoComSucesso";
		}
		
		//Enviando mensagem de erro
		model.addAttribute("mensagem", "senha ou usuário incorreto!");
		
		//Voltando para tela de login
		return"forward:login";
	}
}
