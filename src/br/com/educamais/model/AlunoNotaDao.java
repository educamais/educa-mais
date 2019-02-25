package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AlunoNotaDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";
	
	public void salvar(AlunoNota alunoNota) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.persist(alunoNota);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}

	public List<AlunoNota> getListaAlunoNota(Atividade atividade) {
			
			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			
			Query query = manager.createQuery("FROM AlunoNota WHERE atividade = :atividade");
			query.setParameter("atividade", atividade);
			
			List<AlunoNota> listaAlunoNota = query.getResultList();
			
			manager.close();
			factory.close();
			
			if(listaAlunoNota.isEmpty()) {
				return null;
			}
			
			return listaAlunoNota;
	}

	public void remove(AlunoNota alunoNota) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		Object c =manager.merge(alunoNota);
		manager.remove(c);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}

	public List<Usuario> getListaAluno(Atividade atividade) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM AlunoNota WHERE atividade = :atividade");
		query.setParameter("atividade", atividade);
		
		List<AlunoNota> listaAlunoNota = query.getResultList();
		
		manager.close();
		factory.close();
		
		List<Usuario> listaAluno = new ArrayList<>();
		
		if(!listaAlunoNota.isEmpty()) {
			
			for(AlunoNota aluno : listaAlunoNota) {
				listaAluno.add(aluno.getAluno());
			}
		}
		
		if(listaAluno.isEmpty()) {
			return null;
		}
		
		return listaAluno;
	}

	public AlunoNota buscarPorId(int idAlunoNota) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		AlunoNota obj = null;
		
		obj = manager.find(AlunoNota.class, idAlunoNota);
		
		manager.close();
		factory.close();
		
		return obj;
	}

	public void alterar(AlunoNota alunoNota) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(alunoNota);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}

}
