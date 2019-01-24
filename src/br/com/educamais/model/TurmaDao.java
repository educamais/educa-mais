package br.com.educamais.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class TurmaDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";
	
	public boolean verificarExistencia(Turma turma) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		String codigoProfessor = turma.getCodigoProfessor() != null ? turma.getCodigoProfessor() : "";
		String codigoAluno = turma.getCodigoAluno() != null ? turma.getCodigoAluno() : "";
		Query query = null;
		
		if(!codigoProfessor.equals("") && !codigoAluno.equals("")) {
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Turma WHERE codigoProfessor = :codigoProfessor or codigoAluno = :codigoAluno");
			query.setParameter("codigoProfessor", codigoProfessor);
			query.setParameter("codigoAluno", codigoAluno);
		}
		
		List<Turma> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(result.size() == 1) {
			return true;
		}
		
		return false;
	}
	
	public void salvar(Turma turma) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.persist(turma);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
}
