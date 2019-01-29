package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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
	
	@ManyToOne
	@JoinColumn(name = "id_professor")
	private Usuario professor;
	
	@Column(name="codigo_aluno")
	private String codigoAluno;

	@ManyToMany(mappedBy="listaAlunoTurma", cascade=CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Usuario> listaAluno = new ArrayList<Usuario>();

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

	public Usuario getProfessor() {
		return professor;
	}

	public void setProfessor(Usuario professor) {
		this.professor = professor;
	}

	public String getCodigoAluno() {
		return codigoAluno;
	}

	public void setCodigoAluno(String codigoAluno) {
		this.codigoAluno = codigoAluno;
	}

	public List<Usuario> getListaAluno() {
		return listaAluno;
	}

	public void setListaAluno(List<Usuario> listaAluno) {
		this.listaAluno = listaAluno;
	}
}
