package br.com.educamais.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;

@Controller
public class UsuarioController {

	@RequestMapping("usuario")
	public String usuario() {
		return "telaUsuario";
	}
	
	@RequestMapping("aluno")
	public String aluno() {
		return "telaAluno";
	}
	
	@RequestMapping("professor")
	public String professor() {
		return "telaProfessor";
	}
}
