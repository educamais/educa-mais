package br.com.educamais.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="professor_turma")
public class ProfessorTurma {

	@Id
	private int id_professor_turma;
	
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name="id_turma")
	private Turma turma;

	public int getId_professor_turma() {
		return id_professor_turma;
	}

	public void setId_professor_turma(int id_professor_turma) {
		this.id_professor_turma = id_professor_turma;
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
