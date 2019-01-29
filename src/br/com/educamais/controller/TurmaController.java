package br.com.educamais.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;
import br.com.educamais.util.Util;

@Controller
public class TurmaController {

	@RequestMapping("turma/save")
	public String save(Turma turma, HttpSession session, Model model) {
		
		if(session.getAttribute("usuario") == null) {
			model.addAttribute("mensagem", "Usuário não está autenticado!");
			return "mensagem";
		}
		
		TurmaDao turmaDao = new TurmaDao();
		
		String uniqueID = Util.randomHex();
		turma.setCodigoAluno(uniqueID);
		
		Usuario professor = (Usuario) session.getAttribute("usuario");
		turma.setProfessor(professor);
		
		turmaDao.salvar(turma);
		
		model.addAttribute("mensagem", "Turma criada com sucesso!");
		model.addAttribute("link", "professor?id="+turma.getIdTurma());
		
		return "mensagem";
	}
	
	@RequestMapping("turma/entrarSala")
	public String entraSala(@RequestParam("codigo") String codigo, HttpSession session, Model model) {
		
		if(session.getAttribute("usuario") == null) {
			model.addAttribute("mensagem", "Usuário não está autenticado!");
			return "mensagem";
		}
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		TurmaDao dao = new TurmaDao();
		Turma turma = dao.buscarSala(codigo);
		
		if(turma.equals(null)) {
			model.addAttribute("mensagem", "Sala não existe");
			model.addAttribute("link", "usuario");
			return "mensagem";
		}
		dao.entrarSala(usuario, turma);
		
		model.addAttribute("link", "aluno?id="+turma.getIdTurma());
		return "mensagem";
	}
	
	@RequestMapping("turma/minhasTurmas")
	public String entraSala(HttpSession session, Model model) {
		
		if(session.getAttribute("usuario") == null) {
			model.addAttribute("mensagem", "Usuário não está autenticado!");
			return "mensagem";
		}
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		List<Turma> turmasProfessor = turmaDao.listar(usuario);
		
		model.addAttribute("turmasProfessor", turmasProfessor);
		model.addAttribute("usuario", usuario);
		return "telaUsuario";
	}
}
