package br.com.educamais.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="aluno_turma")
public class AlunoTurma {

	@Id
	private int id_aluno_turma;
	
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name="id_turma")
	private Turma turma;

	public int getId_professor_turma() {
		return id_aluno_turma;
	}

	public void setId_professor_turma(int id_aluno_turma) {
		this.id_aluno_turma = id_aluno_turma;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Turma getTurma() {
		return turma;
	}

	public void setTurma(Turma turma) {
		this.turma = turma;
	}
}
