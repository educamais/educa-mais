package br.com.educamais.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class PostagemDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";
	
	public void salvar(Postagem post) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.persist(post);
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
			query = manager.createQuery("FROM Postagem WHERE turma = :turma AND tituloPostagem = :tituloPostagem AND descricaoPostagem = :descricaoPostagem");
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
	
	public List<Postagem> getListaPostagem(Turma turma) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = null;

		turma = turma != null ? turma : null;
		
		if (turma != null) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Postagem p WHERE turma = :turma ORDER BY p.idPostagem DESC");
			query.setParameter("turma", turma);
		}

		List<Postagem> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if (result.isEmpty()) {
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
