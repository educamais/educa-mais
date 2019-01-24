package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="turma")
public class Turma {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_turma")
	private int idTurma;
	
	@Column(name="nome_turma")
	private String nomeTurma;
	
	@Column(name="codigo_professor")
	private String codigoProfessor;
	
	@Column(name="codigo_aluno")
	private String codigoAluno;

	@ManyToMany(mappedBy="listaAlunoTurma", cascade=CascadeType.ALL)
    private List<Usuario> listaAluno = new ArrayList<Usuario>();
	
	@ManyToMany(mappedBy="listaProfessorTurma", cascade=CascadeType.ALL)
    private List<Usuario> listaProfessor = new ArrayList<Usuario>();

	public List<Usuario> getListaProfessor() {
		return listaProfessor;
	}

	public void setListaProfessor(List<Usuario> listaProfessor) {
		this.listaProfessor = listaProfessor;
	}

	public List<Usuario> getListaAluno() {
		return listaAluno;
	}

	public void setListaAluno(List<Usuario> listaAluno) {
		this.listaAluno = listaAluno;
	}
	
	public int getIdTurma() {
		return idTurma;
	}

	public void setIdTurma(int idTurma) {
		this.idTurma = idTurma;
	}

	public String getNomeTurma() {
		return nomeTurma;
	}

	public void setNomeTurma(String nomeTurma) {
		this.nomeTurma = nomeTurma;
	}

	public String getCodigoProfessor() {
		return codigoProfessor;
	}

	public void setCodigoProfessor(String codigoProfessor) {
		this.codigoProfessor = codigoProfessor;
	}

	public String getCodigoAluno() {
		return codigoAluno;
	}

	public void setCodigoAluno(String codigoAluno) {
		this.codigoAluno = codigoAluno;
	}
}
