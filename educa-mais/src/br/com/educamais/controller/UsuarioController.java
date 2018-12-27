package br.com.educamais.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.educamais.model.UsuarioDao;

@Controller
public class UsuarioController {

	@RequestMapping("login")
	public String telaLogin() {
		return"telaLogin";
	}
	
	@RequestMapping("autenticar")
	public String autenticar(@RequestParam("email") String email, @RequestParam("senha") String senha, Model model) {
		UsuarioDao dao = new UsuarioDao();
		if(dao.autenticar(email, senha)) {
			return"logadoComSucesso";
		}
		model.addAttribute("mensagem", "senha ou usuário incorreto!");
		return"forward:login";
	}
}
