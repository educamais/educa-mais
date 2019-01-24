package br.com.educamais.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;
import br.com.educamais.util.Util;

@Controller
public class TurmaController {

	@RequestMapping("turma/save")
	public String save(Turma turma, HttpServletRequest request, Model model) {
		
		String uniqueID = Util.randomHex();
		
		turma.setCodigoAluno("ALU"+uniqueID);
		turma.setCodigoProfessor("PRO"+uniqueID);
		
		TurmaDao dao = new TurmaDao();
		
		while(dao.verificarExistencia(turma)) {
			uniqueID = Util.randomHex();
			
			turma.setCodigoAluno("ALU"+uniqueID);
			turma.setCodigoProfessor("PRO"+uniqueID);
		}
		
		dao.salvar(turma);
		
		model.addAttribute("mensagem", "Turma criada com sucesso!");
		model.addAttribute("link", "usuario");
		
		return "mensagem";
	}
}
