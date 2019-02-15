package br.com.educamais.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="aluno_turma")
public class AlunoTurma {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_aluno_turma")
	private int idAlunoTurma;
	
	@ManyToOne
    @JoinColumn(name="turma")
    private Turma turma;
	
	@ManyToOne
    @JoinColumn(name="aluno")
    private Usuario aluno;
	
	//GET E SET

	public int getIdAlunoTurma() {
		return idAlunoTurma;
	}

	public void setIdAlunoTurma(int idAlunoTurma) {
		this.idAlunoTurma = idAlunoTurma;
	}

	public Turma getTurma() {
		return turma;
	}

	public void setTurma(Turma turma) {
		this.turma = turma;
	}

	public Usuario getAluno() {
		return aluno;
	}

	public void setAluno(Usuario aluno) {
		this.aluno = aluno;
	}
}
