package br.com.educamais.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;

@Controller
public class SistemaPrincipal {
	
	@RequestMapping("autenticar")
	public String autenticar(Usuario usuario, Model model, HttpSession session) {

		UsuarioDao dao = new UsuarioDao();

		if (dao.verificarExistencia(usuario)) {
			session.setAttribute("usuario", usuario);
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Logado com sucesso");
			return "mensagem";
		}
		model.addAttribute("mensagem", "Usuário ou senha incorreto!");
		return "mensagem";
	}

	
	@RequestMapping("save")
	public String save(Usuario usuario, Model model) {

		UsuarioDao dao = new UsuarioDao();
		
		if (dao.verificarExistencia(usuario)) {
			model.addAttribute("mensagem", "E-mail já cadastrado!");
			return "mensagem";
		}

		dao.salvar(usuario);
		
		model.addAttribute("link", "telaUsuario");
		model.addAttribute("mensagem", "Conta criada com sucesso!");
		return "mensagem";
	}
}
