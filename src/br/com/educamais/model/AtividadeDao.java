package br.com.educamais.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AtividadeDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";
	
	public Atividade salvar(Atividade atividade) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.persist(atividade);
		manager.refresh(atividade);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
		
		return atividade;
	}

	public List<Atividade> getlistAtividade(Turma turma, String pesquisarAtividade) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		turma = turma != null ? turma : null;
		
		Query query = null;
		
		if (turma != null && pesquisarAtividade == null) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Atividade a WHERE turma = :turma ORDER BY a.idAtividade DESC");
			query.setParameter("turma", turma);
		}else if(turma != null && pesquisarAtividade != null) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Atividade a WHERE turma = :turma AND nomeAtividade LIKE :nomeAtividade ORDER BY a.idAtividade DESC, a.dataAtividade DESC");
			query.setParameter("turma", turma);
			query.setParameter("nomeAtividade", "%"+pesquisarAtividade+"%");
			
		}else if(turma == null && pesquisarAtividade != null) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Atividade a WHERE nomeAtividade LIKE :nomeAtividade ORDER BY a.idAtividade DESC");
			query.setParameter("nomeAtividade", "%"+pesquisarAtividade+"%");
		}

		List<Atividade> listaAtividade = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(listaAtividade.isEmpty()) {
			return null;
		}
		
		return listaAtividade;
	}
	
	
	public Atividade getAtividade(Atividade atividade) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		List<Atividade> listaAtividade = null;
		
		Query query = null;
		
		if (atividade != null) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Atividade WHERE nomeAtividade = :nomeAtividade AND dataAtividade = :dataAtividade AND turma = :turma");
			query.setParameter("nomeAtividade", atividade.getNomeAtividade());
			query.setParameter("dataAtividade", atividade.getDataAtividade());
			query.setParameter("turma", atividade.getTurma());
			
			listaAtividade = query.getResultList();
		}

		manager.close();
		factory.close();
		
		if(listaAtividade.isEmpty()) {
			return null;
		}
		
		return listaAtividade.get(0);
	}

	public void remover(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		Atividade atividade = manager.find(Atividade.class, id);
		
		manager.getTransaction().begin();
		Object c = manager.merge(atividade);
		manager.remove(c);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
		
	}

	public Atividade buscarPorId(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		Atividade atividade = manager.find(Atividade.class, id);
		
		manager.close();
		factory.close();
		
		return  atividade;
	}

}
