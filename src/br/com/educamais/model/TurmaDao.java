package br.com.educamais.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class TurmaDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";
	
	public Turma verificarExistencia(Turma turma) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		String codigoAluno = turma.getCodigoAluno() != null ? turma.getCodigoAluno() : "";
		
		Query query = null;
		
		if(!codigoAluno.equals("")) {
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Turma WHERE codigoAluno = :codigoAluno");
			query.setParameter("codigoAluno", codigoAluno);
		}
		
		List<Turma> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(result.size() == 0) {
			return null;
		}
		
		return result.get(0);
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
	
	public List<Turma> listar(Usuario usuario){
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM Turma WHERE id_professor = :paramProfessor");
		query.setParameter("paramProfessor", usuario);
		
		List<Turma> listaTurma = query.getResultList();
		
		manager.close();
		factory.close();
		
		return listaTurma;
	}
	
	public Turma buscarPorId(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		Turma turma = manager.find(Turma.class, id);
		
		manager.close();
		factory.close();
		
		return  turma;
	}
	
	public Turma buscarSala(String codigo) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		if(codigo.equals("") || codigo.equals(null)) {
			return null;
		}
		
		Query query = manager.createQuery("FROM Turma WHERE codigo_aluno = :paramCodigo");
		query.setParameter("paramCodigo", codigo);
		
		Turma turma = (Turma)query.getSingleResult();
		
		manager.close();
		factory.close();
		
		return  turma;
	}
		
	public void entrarSala(Usuario usuario, Turma turma) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		
		List<Turma> listaTurma = usuario.getListaAlunoTurma();
		listaTurma.add(turma);
		usuario.setListaAlunoTurma(listaTurma);
		
		manager.getTransaction().begin();
		manager.merge(usuario);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
	
}
