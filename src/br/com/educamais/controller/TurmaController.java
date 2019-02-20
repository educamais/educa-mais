package br.com.educamais.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import br.com.educamais.model.AlunoTurmaDao;
import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;
import br.com.educamais.util.Util;

@Controller
public class TurmaController {

	@RequestMapping("turma/save")
	public String save(Turma turma, HttpSession session, Model model) {
		
		TurmaDao turmaDao = new TurmaDao();
		
		String uniqueID = Util.randomHex();
		turma.setCodigoTurma(uniqueID);
		
		Usuario professor = (Usuario) session.getAttribute("usuario");
		turma.setProfessor(professor);
		
		turmaDao.salvar(turma);
		
		return "redirect:/usuario";
	}
	
	@RequestMapping("turma/participar")
	public String entraSala(@RequestParam("codigo") String codigo, HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarSala(codigo);
		
		if(turma == null) {
			model.addAttribute("mensagem", "Sala não existe");
			model.addAttribute("link", "usuario");
			return "mensagem";
		}
		
		if(turma.getProfessor().getIdUsuario() == usuario.getIdUsuario()) {
			model.addAttribute("mensagem", "Você não pode ser aluno e professor da mesma sala!");
			model.addAttribute("link", "usuario");
			return "mensagem";
		}
		
		AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
		alunoTurmaDao.participar(usuario, turma);
		
		return "redirect:/aluno?id="+turma.getIdTurma();
	}
	
	@RequestMapping("turma/minhasturmas")
	public String entraSala(HttpSession session, Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		List<Turma> turmasProfessor = turmaDao.listar(usuario);
		
		model.addAttribute("turmasProfessor", turmasProfessor);
		model.addAttribute("usuario", usuario);
		return "telaUsuario";
	}
	
	@RequestMapping("turma/remover")
	public String entraSala(@RequestParam("id") int id) {
		AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
		TurmaDao turmaDao = new TurmaDao();
		
		Turma  turma = turmaDao.buscarPorId(id);
		
		alunoTurmaDao.remover(turma);
		turmaDao.remover(id);
		
		return "redirect:/usuario";
	}
	
	
	@RequestMapping("test")
	public String test(){
		
		return "mensagem";
	}
	@RequestMapping("test2")
	public String test2(){
		
		return "erros/erro";
	}
	@RequestMapping("test3")
	public String test3(){
		
		return "erros/404";
	}
}
