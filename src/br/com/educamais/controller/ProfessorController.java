package br.com.educamais.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.educamais.model.AlunoNota;
import br.com.educamais.model.AlunoNotaDao;
import br.com.educamais.model.AlunoTurmaDao;
import br.com.educamais.model.Atividade;
import br.com.educamais.model.AtividadeDao;
import br.com.educamais.model.Postagem;
import br.com.educamais.model.PostagemDAO;
import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;

@Controller
public class ProfessorController {

	@RequestMapping("professor/mural")
	public String professorMural(@RequestParam("id") int id, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(id);
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
				
				PostagemDAO postagemDao = new PostagemDAO();
				List<Postagem> listaPostagem = postagemDao.getListaPostagem(turma, 0);
				
				for (Postagem postagem : listaPostagem) {
					System.out.println(postagem.getIdPostagem());
					System.out.println(postagem.getTituloPostagem());
					System.out.println(postagem.getListaArquivo().size());
				}
				
				AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
				List<Usuario> listaAluno = alunoTurmaDao.getListaAluno(turma);
				
				model.addAttribute("turma", turma);
				model.addAttribute("listaPostagem", listaPostagem);
				model.addAttribute("listaAluno", listaAluno);
				return "professor/telaProfessorMural";
			}
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Você não é professor dessa turma!");
			return "mensagem";
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
	
	@RequestMapping("professor/atividade")
	public String professorAtividade(@RequestParam("id") int id, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(id);
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
				
				AtividadeDao atividadeDao = new AtividadeDao();
				List<Atividade> listaAtividade = atividadeDao.getlistAtividade(turma, null);
				
				AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
				List<Usuario> listaAluno = alunoTurmaDao.getListaAluno(turma);
				
				model.addAttribute("turma", turma);
				model.addAttribute("listaAtividade", listaAtividade);
				model.addAttribute("listaAluno", listaAluno);
				return "professor/telaProfessorAtividade";
			}
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Você não é professor dessa turma!");
			return "mensagem";
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
	
	@RequestMapping("professor/participantes")
	public String professorParticipantes(@RequestParam("id") int id, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(id);
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
								
				AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
				List<Usuario> listaAluno = alunoTurmaDao.getListaAluno(turma);
				
				model.addAttribute("turma", turma);
				model.addAttribute("listaAluno", listaAluno);
				return "professor/telaProfessorParticipantes";
			}
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Você não é professor dessa turma!");
			return "mensagem";
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
	
	@RequestMapping("professor/desempenho")
	public String desempenho(@RequestParam int idTurma, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		if(turma != null) {
			if(turma.getProfessor().getIdUsuario() == usuario.getIdUsuario()) {
				AlunoNotaDao alunoNotaDao = new AlunoNotaDao();
				List<AlunoNota> listaAlunoNota = alunoNotaDao.getListaAlunoNota(turma, null, null);
				
				AtividadeDao atividadeDao =  new AtividadeDao();
				List<Atividade> listaAtividade = atividadeDao.getlistAtividade(turma, null);
				
				model.addAttribute("turma", turma);
				model.addAttribute("listaAlunoNota", listaAlunoNota);
				model.addAttribute("listaAtividade", listaAtividade);
				
				return "professor/desempenho";
			}
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Você não é professor dessa turma!");
			return "mensagem";
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
}
