package br.com.educamais.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="postagem")
public class Postagem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_postagem")
	private int idPostagem;
	
	@ManyToOne
    @JoinColumn(name="turma")
    private Turma turma;
	
	@Column(name="titulo_postagem")
	private String tituloPostagem;
	
	@Column(name="descricao_postagem")
	private String descricaoPostagem;
	
	@Column(name="data_postagem")
	private Date dataPostagem;
	
	@OneToMany(fetch=FetchType.EAGER)
    @JoinColumn(name="postagem")
	private List<ArquivoPostagem> listaArquivo;
	
	// GET E SET
	
	public int getIdPostagem() {
		return idPostagem;
	}

	public void setIdPostagem(int idPostagem) {
		this.idPostagem = idPostagem;
	}

	public Turma getTurma() {
		return turma;
	}

	public void setTurma(Turma turma) {
		this.turma = turma;
	}

	public String getTituloPostagem() {
		return tituloPostagem;
	}

	public void setTituloPostagem(String tituloPostagem) {
		this.tituloPostagem = tituloPostagem;
	}

	public String getDescricaoPostagem() {
		return descricaoPostagem;
	}

	public void setDescricaoPostagem(String descricaoPostagem) {
		this.descricaoPostagem = descricaoPostagem;
	}

	public Date getDataPostagem() {
		return dataPostagem;
	}

	public void setDataPostagem(Date dataPostagem) {
		this.dataPostagem = dataPostagem;
	}

	public List<ArquivoPostagem> getListaArquivo() {
		return listaArquivo;
	}

	public void setListaArquivo(List<ArquivoPostagem> listaArquivo) {
		this.listaArquivo = listaArquivo;
	}
}
