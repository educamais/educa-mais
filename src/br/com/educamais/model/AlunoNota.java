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
@Table(name="aluno_nota")
public class AlunoNota {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_aluno_nota")
	private int idAlunoNota;
	
	@ManyToOne
    @JoinColumn(name="aluno")
    private Usuario aluno;
	
	@ManyToOne
    @JoinColumn(name="atividade")
    private Atividade atividade;
	
	@Column
	private double nota;

	public int getIdAlunoNota() {
		return this.idAlunoNota;
	}

	public void setIdAlunoNota(int idAlunoNota) {
		this.idAlunoNota = idAlunoNota;
	}

	public Usuario getAluno() {
		return aluno;
	}

	public void setAluno(Usuario aluno) {
		this.aluno = aluno;
	}

	public Atividade getAtividade() {
		return atividade;
	}

	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}

	public double getNota() {
		return nota;
	}

	public void setNota(double nota) {
		this.nota = nota;
	}
}
