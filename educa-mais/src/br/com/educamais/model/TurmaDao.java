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
		
		String codigoPro = turma.getCodigoProfessor() != null ? turma.getCodigoProfessor() : "";
		String codigoAlu = turma.getCodigoAluno() != null ? turma.getCodigoAluno() : "";
		Query query = null;
		
		if(!codigoPro.equals("") && !codigoAlu.equals("")) {
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Turma WHERE codigoProfessor = :codigoProfessor and codigoAluno = :codigoAluno");
			query.setParameter("codigoProfessor", codigoPro);
			query.setParameter("codigoAluno", codigoAlu);
		}
		
		List<Turma> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(result.size() == 1) {
			return true;
		}
		
		return false;
	}
	
	public boolean salvar(Turma turma) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		if(verificarExistencia(turma)) {
			return false;
		}
		
		manager.getTransaction().begin();
		manager.persist(turma);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
		
		return true;
	}
}
