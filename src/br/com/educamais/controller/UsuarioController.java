package br.com.educamais.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.educamais.model.AlunoTurmaDao;
import br.com.educamais.model.ArquivoPostagem;
import br.com.educamais.model.ArquivoPostagemDao;
import br.com.educamais.model.Postagem;
import br.com.educamais.model.PostagemDao;
import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;

@Controller
public class UsuarioController {

	@RequestMapping("usuario")
	public String usuario(HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		List<Turma> turmasProfessor = turmaDao.listar(usuario);
		
		AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
		List<Turma> turmasAluno = alunoTurmaDao.getListaTurma(usuario);
		
		model.addAttribute("usuario", usuario);
		model.addAttribute("turmasProfessor", turmasProfessor);
		model.addAttribute("turmasAluno", turmasAluno);
		
		return "telaUsuario";
	}
	
	@RequestMapping("aluno")
	public String aluno(@RequestParam("id") int id, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		TurmaDao dao = new TurmaDao();
		Turma turma = dao.buscarPorId(id);
		
		AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
		
		if(turma != null) {
			for(Usuario u : alunoTurmaDao.getListaAluno(turma)) {
				if(u.getIdUsuario() == usuario.getIdUsuario()) {
					model.addAttribute("turma", turma);
					model.addAttribute("usuario", usuario);
					return "telaAluno";
				}
			}
		}
		
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
		
	}
	
	@RequestMapping("professor")
	public String professor(@RequestParam("id") int id, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(id);
		
		PostagemDao postagemDao = new PostagemDao();
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
				
				AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao(); 
				
				List<Usuario> listaAluno = alunoTurmaDao.getListaAluno(turma);
				
				List<Postagem> listaPostagem = postagemDao.getListaPostagem(turma);
				
				model.addAttribute("usuario", usuario);
				model.addAttribute("turma", turma);
				model.addAttribute("listaAluno", listaAluno);
				model.addAttribute("listaPostagem", listaPostagem);
				return "telaProfessor";
			}
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "index";
	}
}
