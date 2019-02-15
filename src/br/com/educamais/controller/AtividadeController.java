package br.com.educamais.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.educamais.model.AlunoTurmaDao;
import br.com.educamais.model.Atividade;
import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;

@Controller
public class AtividadeController {

	@RequestMapping("atividade/save")
	public String cadastroAdd(Atividade atividade, @RequestParam("id") int idTurma, @RequestParam("notaAluno") double[] notasAluno, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
				
				//Código entra aqui
				
				return "";
			}
			
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Você não é professor da sala!");
			return "mensagem";
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
}
