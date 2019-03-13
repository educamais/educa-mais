package br.com.educamais.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import br.com.educamais.model.AlunoNota;
import br.com.educamais.model.AlunoNotaDao;
import br.com.educamais.model.Atividade;
import br.com.educamais.model.AtividadeDao;
import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;

@Controller
public class AtividadeController {
	
	@RequestMapping("atividade/save")
	public String atividadeAdd(Atividade atividade, @RequestParam("id") int idTurma, @RequestParam("notaAluno") String[] notaAluno, @RequestParam("idAluno") String[] idAluno, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
				
				Date date = new Date();
				atividade.setDataAtividade(date);
				atividade.setTurma(turma);
				
				AtividadeDao atividadeDao = new AtividadeDao();
				Atividade UltimaAtividade = atividadeDao.salvar(atividade);
				
				UsuarioDao usuarioDao = new UsuarioDao();
				AlunoNotaDao alunoNotaDao = new AlunoNotaDao();
				
				for(int i = 0; i < idAluno.length; i++) {
					
					if(!idAluno[i].equals("")) {
						
						double nota = 0;
						
						if(!notaAluno[i].equals("")) {
							nota = Double.parseDouble(notaAluno[i]);
						}
						
						Usuario aluno = usuarioDao.buscarPorId(Integer.parseInt(idAluno[i]));
						AlunoNota alunoNota = new AlunoNota();
						
						alunoNota.setAluno(aluno);
						alunoNota.setAtividade(UltimaAtividade);
						alunoNota.setNota(nota);
	
						alunoNotaDao.salvar(alunoNota);
					}
				}
				
				return "redirect:/professor/atividade?id=" + idTurma;
			}
			
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Você não é professor da sala!");
			return "mensagem";
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}

	@RequestMapping(value = "/atividade/filter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String filter(@RequestParam String pesquisarAtividade, @RequestParam int idTurma) {
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		AtividadeDao atividadeDao = new AtividadeDao();
		List<Atividade> listaAtividade = atividadeDao.getlistAtividade(turma, pesquisarAtividade);
		
		return new Gson().toJson(listaAtividade);
	}
	
	@RequestMapping(value = "/atividade/alunos", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String filter(@RequestParam int idAtividade) {
		
		AtividadeDao atividadeDao = new AtividadeDao();
		Atividade atividade = atividadeDao.buscarPorId(idAtividade);
		
		AlunoNotaDao alunoNotaDao = new AlunoNotaDao();
		List<AlunoNota> listaAluno = alunoNotaDao.getListaAlunoNota(atividade);
		
		return new Gson().toJson(listaAluno);
	}
	
	@RequestMapping("/atividade/remove")
	public String remover(@RequestParam("id") int idTurma, @RequestParam("idAtividade") int idAtividade) {
		
		AtividadeDao atividadeDao = new AtividadeDao();
		Atividade atividade = atividadeDao.buscarPorId(idAtividade);
		
		AlunoNotaDao alunoNotaDao = new AlunoNotaDao();
		List<AlunoNota> listaAlunoNota = alunoNotaDao.getListaAlunoNota(atividade);
		
		if(listaAlunoNota != null) {
			
			for(AlunoNota alunoNota : listaAlunoNota) {
				alunoNotaDao.remove(alunoNota);
			}
		}
		
		atividadeDao.remover(idAtividade);
		
		return "redirect:/professor/atividade?id="+idTurma;
	}
	
	@RequestMapping(value="atividade/listagem", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String listagem(@RequestParam int idAtividade) {
		
		AtividadeDao atividadeDao = new AtividadeDao();
		Atividade atividade = atividadeDao.buscarPorId(idAtividade);
		
		AlunoNotaDao alunoNotaDao = new AlunoNotaDao();
		List<AlunoNota> listaAlunoNota = alunoNotaDao.getListaAlunoNota(atividade);
		
		return new Gson().toJson(listaAlunoNota);
	}

	@RequestMapping("atividade/alterar")
	public String update(@RequestParam int[] idAlunoNota, @RequestParam int idTurma, @RequestParam Integer[] nota, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
				
				AlunoNotaDao alunoNotaDao = new AlunoNotaDao();
				
				for(int i = 0; i < idAlunoNota.length; i++) {
					
					AlunoNota alunoNota = alunoNotaDao.buscarPorId(idAlunoNota[i]);
					if(nota[i] != null) {
						alunoNota.setNota(nota[i]);
					}else {
						alunoNota.setNota(0);
					}
					
					alunoNotaDao.alterar(alunoNota);
				}
				model.addAttribute("atividade", "1");
				return "redirect:/professor/atividade?id=" + idTurma;
			}
			
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Você não é professor da sala!");
			return "mensagem";
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
	
	
	@RequestMapping(value="atividade/atividades", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String atividades(@RequestParam int idUsuario, @RequestParam int idTurma) {
		
		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuario = usuarioDao.buscarPorId(idUsuario);
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		AlunoNotaDao alunoNotaDao = new AlunoNotaDao();
		List<AlunoNota> listaAlunoNota = alunoNotaDao.getListaAlunoNota(turma, null, usuario);
		
		return new Gson().toJson(listaAlunoNota);
	}
}
