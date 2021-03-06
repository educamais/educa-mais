package br.com.educamais.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="arquivo_postagem")
public class ArquivoPostagem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_arquivo_postagem")
	private int idArquivoPostagem;
	
	@ManyToOne
	@Exclude
	private Postagem postagem;
	
	@Column
    private String arquivo;

	public int getIdArquivoPostagem() {
		return idArquivoPostagem;
	}

	public void setIdArquivoPostagem(int idArquivoPostagem) {
		this.idArquivoPostagem = idArquivoPostagem;
	}

	public Postagem getPostagem() {
		return postagem;
	}

	public void setPostagem(Postagem postagem) {
		this.postagem = postagem;
	}

	public String getArquivo() {
		return arquivo;
	}

	public void setArquivo(String arquivo) {
		this.arquivo = arquivo;
	}
}
