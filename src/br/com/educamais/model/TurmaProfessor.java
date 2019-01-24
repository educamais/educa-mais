package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

public class TurmaProfessor {
	
	private Turma turma;
	

	@ManyToMany(mappedBy="listaProfessorTurma", cascade=CascadeType.ALL)
    private List<Usuario> listaProfessor = new ArrayList<Usuario>();


	public Turma getTurma() {
		return turma;
	}


	public void setTurma(Turma turma) {
		this.turma = turma;
	}


	public List<Usuario> getListaProfessor() {
		return listaProfessor;
	}


	public void setListaProfessor(List<Usuario> listaProfessor) {
		this.listaProfessor = listaProfessor;
	}

	
	
	
	
}
