package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AlunoTurmaDao {
	
	private static final String PERSISTENCE_UNIT = "educa-mais";

	public List<Usuario> getListaAluno(Turma turma){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM AlunoTurma WHERE turma = :paramTurma");
		query.setParameter("paramTurma", turma);
		
		List<AlunoTurma> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		List<Usuario> listaAluno = new ArrayList<Usuario>();
		
		for(AlunoTurma alunoTurma : result) {
			listaAluno.add(alunoTurma.getAluno());
		}
		
		return listaAluno;
	}
	
	public List<Turma> getListaTurma(Usuario aluno){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM AlunoTurma WHERE aluno = :paramAluno");
		query.setParameter("paramAluno", aluno);
		
		List<AlunoTurma> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		List<Turma> listaTurma = new ArrayList<Turma>();
			
		for(AlunoTurma alunoTurma : result) {
			Turma turma = alunoTurma.getTurma();
			listaTurma.add(turma);
		}
		return listaTurma;
	}
	
	public void participar(Usuario usuario, Turma turma) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		
		AlunoTurma alunoTurma = new AlunoTurma();
		
		alunoTurma.setAluno(usuario);
		alunoTurma.setTurma(turma);
		
		manager.getTransaction().begin();
		manager.persist(alunoTurma);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
	
	public void remover(Turma turma){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM AlunoTurma WHERE turma = :paramTurma");
		query.setParameter("paramTurma", turma);
		
		manager.getTransaction().begin();
		
		List<AlunoTurma> result = query.getResultList();
		for(AlunoTurma alunoTurma : result) {
			manager.remove(alunoTurma);
		}

		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
	
}
