package br.com.educamais.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;

@Controller
public class SistemaPrincipal {
	
	@RequestMapping("autenticar")
	public String autenticar(Usuario usuario, Model model, HttpSession session) {

		UsuarioDao dao = new UsuarioDao();
		
		usuario = dao.verificarExistencia(usuario);
		
		if (usuario == null) {
			model.addAttribute("mensagem", "Usuário ou senha incorreto!");
			return "index";
		}
		
		session.setAttribute("usuario", usuario);
		return "redirect:usuario";
	}

	
	@RequestMapping("save")
	public String save(Usuario usuario, Model model, HttpSession session) {

		UsuarioDao dao = new UsuarioDao();
		
		if(dao.verificarExistencia(usuario) == null) {
			
			dao.salvar(usuario);
			
			session.setAttribute("usuario", usuario);
			return "redirect:usuario";
		}
		
		model.addAttribute("mensagem", "E-mail já cadastrado!");
		return "mensagem";
	}
}
