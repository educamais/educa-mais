package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AlunoPostagemDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";

	public List<Usuario> getListaAluno(Postagem postagem){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM AlunoPostagem WHERE postagem = :paramPostagem");
		query.setParameter("paramPostagem", postagem);
		
		List<AlunoPostagem> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		List<Usuario> listaAluno = new ArrayList<Usuario>();
		
		for(AlunoPostagem alunoPostagem : result) {
			listaAluno.add(alunoPostagem.getAluno());
		}
		
		return listaAluno;
	}
	
	public List<Postagem> getListaPostagem(Usuario aluno){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM AlunoPostagem WHERE aluno = :paramAluno");
		query.setParameter("paramAluno", aluno);
		
		List<AlunoPostagem> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		List<Postagem> listaPostagem = new ArrayList<Postagem>();
			
		for(AlunoPostagem alunoPostagem : result) {
			Postagem postagem = alunoPostagem.getPostagem();
			listaPostagem.add(postagem);
		}
		return listaPostagem;
	}
	
	public void salvar(Usuario usuario, Postagem postagem) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		
		AlunoPostagem alunoPostagem = new AlunoPostagem();
		
		alunoPostagem.setAluno(usuario);
		alunoPostagem.setPostagem(postagem);
		
		manager.getTransaction().begin();
		manager.persist(alunoPostagem);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
	
	public void remover(Postagem postagem){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM AlunoPostagem WHERE postagem = :paramPostagem");
		query.setParameter("paramPostagem", postagem);
		
		manager.getTransaction().begin();
		
		List<AlunoPostagem> result = query.getResultList();
		for(AlunoPostagem alunoPostagem : result) {
			manager.remove(alunoPostagem);
		}

		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}

	public void atualizar(AlunoPostagem alunoPostagem) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.merge(alunoPostagem);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
		
	}

	public AlunoPostagem buscarAlunoPostagem(Usuario aluno, Postagem postagem) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		aluno = aluno != null ? aluno : null;
		postagem = postagem != null ? postagem : null;
		
		Query query = null;
		
		if(aluno != null && postagem != null) {
			query = manager.createQuery("FROM AlunoPostagem WHERE  aluno = :paramAluno AND postagem = :paramPostagem");
			query.setParameter("paramAluno", aluno);
			query.setParameter("paramPostagem", postagem);
		}
		
		List<AlunoPostagem> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(result.isEmpty()) {
			return null;
		}
		
		AlunoPostagem alunoPostagem = result.get(0);
		
		return alunoPostagem;
	}
}
