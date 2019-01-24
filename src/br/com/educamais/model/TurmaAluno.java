package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

public class TurmaAluno {
	
	private Turma turma;
	
	@ManyToMany(mappedBy="listaAlunoTurma", cascade=CascadeType.ALL)
    private List<Usuario> listaAluno = new ArrayList<Usuario>();

	public Turma getTurma() {
		return turma;
	}

	public void setTurma(Turma turma) {
		this.turma = turma;
	}

	public List<Usuario> getListaAluno() {
		return listaAluno;
	}

	public void setListaAluno(List<Usuario> listaAluno) {
		this.listaAluno = listaAluno;
	}

	
	
	
}
