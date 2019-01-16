package br.com.educamais.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;

@Controller
public class UsuarioController {


	// Rota para testa tela de usuário
	@RequestMapping("usuario")
	public String telaUsuarioNovo() {
		return "telaUsuario";
	}
	
	// Rota para testa tela de aluno
	@RequestMapping("aluno")
	public String telaAlunoNovo() {
		return "telaAluno";

	}


	//Rota para testa autenticação Recebe como parâmetro um Usuario
	@RequestMapping("autenticar")
	public String autenticar(Usuario usuario) {

		UsuarioDao dao = new UsuarioDao();

		/*
		 * Método boolean que recebe um Usuario e verifica se o mesmo pode autenticar.
		 * se exitir algum registro correspondente o método retorna true e a
		 * autenticação é realizada
		 */
		if (dao.verificarExistencia(usuario)) {
			return "logadoComSucesso";
		}
		
		//Caso contrário o Usuario retorna pra tela de login
		return "index";
	}

	
	//Rota para incluir no banco. Recebe como parâmetro um Usuario e uma String confirmarSenha
	@RequestMapping("save")
	public String save(Usuario usuario, @RequestParam("confirmarSenha") String confirmarSenha) {

		UsuarioDao dao = new UsuarioDao();

		//Se o método salvar retornar true, o usuário é cadastrado
		if (dao.salvar(usuario, confirmarSenha)) {
			return "logadoComSucesso";
		}
		
		//Se o método salvar retornar false, o usuário retornar para tela de login
		return "index";
	}
}
