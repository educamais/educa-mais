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
@Table(name="aluno_postagem")
public class AlunoPostagem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_aluno_postagem")
	private int idAlunoPostagem;
	
	@ManyToOne
    @JoinColumn(name="aluno")
    private Usuario aluno;
	
	@ManyToOne
    @JoinColumn(name="postagem")
    private Postagem postagem;
	
	//GET E SET

	public int getIdAlunoPostagem() {
		return idAlunoPostagem;
	}

	public void setIdAlunoPostagem(int idAlunoPostagem) {
		this.idAlunoPostagem = idAlunoPostagem;
	}

	public Usuario getAluno() {
		return aluno;
	}

	public void setAluno(Usuario aluno) {
		this.aluno = aluno;
	}

	public Postagem getPostagem() {
		return postagem;
	}

	public void setPostagem(Postagem postagem) {
		this.postagem = postagem;
	}
}
