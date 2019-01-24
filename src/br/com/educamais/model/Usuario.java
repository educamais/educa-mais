package br.com.educamais.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="usuario")
public class Usuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_usuario")
	private int idUsuario;
	
	@Column
	private String nome;
	
	@Column
	private String email;
	
	@Column
	private String senha;

	@ManyToMany(cascade=CascadeType.ALL)
    @JoinTable(name="aluno_turma",
    joinColumns={@JoinColumn(name="id_aluno")},
    inverseJoinColumns={@JoinColumn(name="id_turma")})
    private List<Turma> listaAlunoTurma = new ArrayList<Turma>();
	
	@ManyToMany(cascade=CascadeType.ALL)
    @JoinTable(name="professor_turma",
    joinColumns={@JoinColumn(name="id_professor")},
    inverseJoinColumns={@JoinColumn(name="id_turma")})
    private List<Turma> listaProfessorTurma = new ArrayList<Turma>();
	
	
	
	
	
	
	
	
	public List<Turma> getListaProfessorTurma() {
		return listaProfessorTurma;
	}

	public void setListaProfessorTurma(List<Turma> listaProfessorTurma) {
		this.listaProfessorTurma = listaProfessorTurma;
	}

	public List<Turma> getListaAlunoTurma() {
		return listaAlunoTurma;
	}

	public void setListaAlunoTurma(List<Turma> listaAlunoTurma) {
		this.listaAlunoTurma = listaAlunoTurma;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
