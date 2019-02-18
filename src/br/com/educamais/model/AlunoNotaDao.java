package br.com.educamais.model;

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

}
