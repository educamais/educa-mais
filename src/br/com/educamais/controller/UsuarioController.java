package br.com.educamais.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.educamais.model.AlunoTurmaDao;
import br.com.educamais.model.Atividade;
import br.com.educamais.model.AtividadeDao;
import br.com.educamais.model.Postagem;
import br.com.educamais.model.PostagemDao;
import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;

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
		
		
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
				
				PostagemDao postagemDao = new PostagemDao();
				List<Postagem> listaPostagem = postagemDao.getListaPostagem(turma);
				
				AtividadeDao atividadeDao = new AtividadeDao();
				List<Atividade> listaAtividade = atividadeDao.getlistAtividade(turma);
				
				AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
				List<Usuario> listaAluno = alunoTurmaDao.getListaAluno(turma);
				
				model.addAttribute("usuario", usuario);
				model.addAttribute("turma", turma);
				model.addAttribute("listaPostagem", listaPostagem);
				model.addAttribute("listaAtividade", listaAtividade);
				model.addAttribute("listaAluno", listaAluno);
				return "telaProfessor";
			}
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
	
	@RequestMapping("alterarnome")
	public String alterarNome(@RequestParam int idUsuario, @RequestParam int idTurma, @RequestParam String nome, HttpSession session) {
		
		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuario = usuarioDao.buscarPorId(idUsuario);
		
		usuario.setNome(nome);
		
		usuarioDao.atualizar(usuario);
		
		session.setAttribute("usuario", usuario);		
		return "redirect:professor?id="+idTurma;
	}
	
	@RequestMapping("alterarsenha")
	public String alterarSenha(@RequestParam int idUsuario, @RequestParam int idTurma,@RequestParam String senhaAtual, @RequestParam String senhaNova, HttpSession session) {
		
		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuario = usuarioDao.buscarPorId(idUsuario);
		
		if(senhaAtual.equals(usuario.getSenha())) {
			usuario.setSenha(senhaNova);
			usuarioDao.atualizar(usuario);
			
			session.setAttribute("usuario", usuario);		
			return "redirect:professor?id="+idTurma;
		}
		
		return "redirect:professor?id="+idTurma;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "index";
	}
}
