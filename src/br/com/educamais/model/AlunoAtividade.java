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
@Table(name="aluno_atividade")
public class AlunoAtividade {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_aluno_atividade")
	private int idAlunoAtividade;
	
	@ManyToOne
    @JoinColumn(name="aluno")
    private Usuario aluno;
	
	@ManyToOne
    @JoinColumn(name="atividade")
    private Atividade atividade;

	public int getIdAlunoAtividade() {
		return idAlunoAtividade;
	}

	public void setIdAlunoAtividade(int idAlunoAtividade) {
		this.idAlunoAtividade = idAlunoAtividade;
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
}
