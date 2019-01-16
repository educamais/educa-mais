package br.com.educamais.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.util.Util;

@Controller
public class TurmaController {

	@RequestMapping("turma/save")
	public String save(Turma turma, Model model) {
		
		String uniqueID = Util.randomHex();
		
		turma.setCodigoAluno("ALU"+uniqueID);
		turma.setCodigoProfessor("PRO"+uniqueID);
		
		TurmaDao dao = new TurmaDao();
		
		if(dao.salvar(turma)) {
			return "logadoComSucesso";
		}
		
		model.addAttribute("mensagem", "Erro ao criar!");
		
		return "mensagem";
	}
}
