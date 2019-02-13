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

@Controller
public class UsuarioController {

	@RequestMapping("usuario")
	public String usuario(HttpSession session, Model model) {
		
		if(session.getAttribute("usuario") == null) {
			model.addAttribute("mensagem", "Usuário não está autenticado!");
			return "mensagem";
		}
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		List<Turma> turmasProfessor = turmaDao.listar(usuario);
		List<Turma> turmasAluno = usuario.getListaAlunoTurma();
		
		model.addAttribute("usuario", usuario);
		model.addAttribute("turmasProfessor", turmasProfessor);
		model.addAttribute("turmasAluno", turmasAluno);
		
		return "telaUsuario";
	}
	
	
	@RequestMapping("atividade")
	public String atividade(){
		return "telaAtividade";
	}
	
	
	@RequestMapping("aluno")
	public String aluno(@RequestParam("id") int id, HttpSession session, Model model) {
		
		if(session.getAttribute("usuario") == null) {
			model.addAttribute("mensagem", "Usuário não está autenticado!");
			return "mensagem";
		}
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		TurmaDao dao = new TurmaDao();
		Turma turma = dao.buscarPorId(id);
		for(Usuario u : turma.getListaAluno()) {
			if(u.getIdUsuario() == usuario.getIdUsuario()) {
				model.addAttribute("turma", turma);
				model.addAttribute("usuario", usuario);
				return "telaAluno";
			}
		}
		
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Turma inválida!");
		return "mensagem";
		
	}
	
	@RequestMapping("professor")
	public String professor(@RequestParam("id") int id, HttpSession session, Model model) {
		
		if(session.getAttribute("usuario") == null) {
			model.addAttribute("mensagem", "Usuário não está autenticado!");
			return "mensagem";
		}
		
		Usuario usuario = (Usuario)session.getAttribute("usuario"); 
		
		TurmaDao dao = new TurmaDao();
		Turma turma = dao.buscarPorId(id);
		
		if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
			model.addAttribute("turma", turma);
			model.addAttribute("usuario", usuario);
			return "telaProfessor";
		}
		
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Turma inválida!");
		return "mensagem";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session, Model model) {
		
		if(session.getAttribute("usuario") == null) {
			session.removeAttribute("usuario");
			model.addAttribute("mensagem", "Saindo...");
			return "mensagem";
		}
		
		model.addAttribute("mensagem", "Usuário não está autenticado!");
		return "mensagem";
	}
}
