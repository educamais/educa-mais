package br.com.educamais.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;

@Controller
public class SistemaPrincipal {

	@RequestMapping("teste")
	public String teste(HttpSession session) {
		
		return "mensagem";
	}
	
	@RequestMapping("autenticar")
	public String autenticar(Usuario usuario, Model model, HttpSession session) {

		UsuarioDao dao = new UsuarioDao();
		
		usuario = dao.verificarExistencia(usuario);
		
		if (usuario == null) {
			model.addAttribute("mensagem", "Usuário ou senha incorreto!");
			return "mensagem";
		}
		
		session.setAttribute("usuario", usuario);
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Logado com sucesso");
		return "mensagem";
	}

	
	@RequestMapping("save")
	public String save(Usuario usuario, Model model) {

		UsuarioDao dao = new UsuarioDao();
		
		if (dao.verificarExistencia(usuario) == null) {
			dao.salvar(usuario);
			
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Conta criada com sucesso!");
			return "mensagem";
		}
		
		model.addAttribute("mensagem", "E-mail já cadastrado!");
		return "mensagem";
	}
}
