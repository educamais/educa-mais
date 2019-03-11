package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.web.multipart.MultipartFile;

import br.com.educamais.util.Util;

public class PostagemDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";
	
	public void salvar(Postagem postagem, int[] idAlunos, MultipartFile[] files) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.persist(postagem);
		
		UsuarioDao usuarioDao = new UsuarioDao();
		
		for(int id : idAlunos) {
			
			Usuario aluno = usuarioDao.buscarPorId(id);
			
			AlunoPostagem alunoPostagem = new AlunoPostagem();
			alunoPostagem.setAluno(aluno);
			alunoPostagem.setPostagem(postagem);
			
			manager.persist(alunoPostagem);
		}
		
		if(files.length != 0) {
			
			for(MultipartFile file : files) {
				
				if (Util.fazerUploadImagem(file)) {
					
					String arquivo = Util.obterMomentoAtual() + " - " + file.getOriginalFilename();
					
					ArquivoPostagem arquivoPostagem = new ArquivoPostagem();
					arquivoPostagem.setPostagem(postagem);
					arquivoPostagem.setArquivo(arquivo);
					
					manager.persist(arquivoPostagem);
				}
			}
		}
		
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}

	public Postagem buscarPostagem(Postagem postagem) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = null;

		Turma turma = postagem.getTurma() != null ? postagem.getTurma() : null;
		String tituloPostagem = postagem.getTituloPostagem() != null ? postagem.getTituloPostagem() : "";
		String descricaoPostagem = postagem.getDescricaoPostagem() != null ? postagem.getDescricaoPostagem() : "";
		
		if (turma != null && !tituloPostagem.equals("") && !descricaoPostagem.equals("")) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Postagem WHERE turma = :turma AND tituloPostagem = :tituloPostagem AND descricaoPostagem = :descricaoPostagem").setMaxResults(5);
			query.setParameter("turma", turma);
			query.setParameter("tituloPostagem", tituloPostagem);
			query.setParameter("descricaoPostagem", descricaoPostagem);
			
		}

		List<Postagem> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if (result.isEmpty()) {
			return null;
		}
		
		postagem = result.get(0);
		
		return postagem;
	}
	
	public List<Postagem> getListaPostagem(Turma turma, int inicio) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = null;

		turma = turma != null ? turma : null;
		
		if (turma != null) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Postagem WHERE turma = :turma ORDER BY dataPostagem DESC, idPostagem DESC");
			query.setParameter("turma", turma);
		}
		query.setFirstResult(inicio);
		query.setMaxResults(5);
		List<Postagem> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(result.isEmpty()) {
			return null;
		}
		
		return result;
	}

	public Postagem buscarPorId(int idTurma) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Postagem postagem = manager.find(Postagem.class, idTurma);
		
		manager.close();
		factory.close();
		
		return postagem;
	}

	public void remover(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		Postagem postagem = manager.find(Postagem.class, id);
		
		manager.getTransaction().begin();
		manager.remove(postagem);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}

	public void atualizar(Postagem postagem) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
	
		manager.getTransaction().begin();
		manager.merge(postagem);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
}
