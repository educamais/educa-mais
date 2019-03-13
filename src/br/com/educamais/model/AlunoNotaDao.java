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
	
	public List<AlunoNota> getListaAlunoNota(Turma turma, String pesquisarNome, Usuario aluno) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query;
		
		if(pesquisarNome == null && aluno == null && turma != null) {
			
			query = manager.createQuery("SELECT alunoNota.aluno, SUM(alunoNota.nota) FROM AlunoNota alunoNota WHERE alunoNota.atividade IN (FROM Atividade a WHERE a.turma = :turma) GROUP BY alunoNota.aluno ORDER BY SUM(alunoNota.nota) DESC");
			query.setParameter("turma", turma);
		} else if(turma != null && aluno != null && pesquisarNome == null) {
			
			query = manager.createQuery("FROM AlunoNota alunoNota WHERE alunoNota.atividade IN (FROM Atividade a WHERE a.turma = :turma) AND alunoNota.aluno = :aluno ORDER BY alunoNota.atividade.dataAtividade DESC, alunoNota.idAlunoNota DESC");
			query.setParameter("turma", turma);
			query.setParameter("aluno", aluno);
		} else {
			query = manager.createQuery("SELECT alunoNota.aluno, SUM(alunoNota.nota) FROM AlunoNota alunoNota WHERE alunoNota.atividade IN (FROM Atividade a WHERE a.turma = :turma) AND alunoNota.aluno.nome LIKE :alunoNome GROUP BY alunoNota.aluno");
			query.setParameter("turma", turma);
			query.setParameter("alunoNome", "%"+pesquisarNome+"%");
		}
		
		
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

	public List<Usuario> getListaAluno(Turma turma) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM AlunoTurma WHERE turma = :turma");
		query.setParameter("turma", turma);
		
		List<AlunoTurma> listaAlunoNota = query.getResultList();
		
		manager.close();
		factory.close();
		
		List<Usuario> listaAluno = new ArrayList<>();
		
		if(!listaAlunoNota.isEmpty()) {
			
			for(AlunoTurma aluno : listaAlunoNota) {
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

	public List<AlunoNota> getPontuacao(Usuario aluno, Turma turma) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query;
		
		query = manager.createQuery("SELECT SUM(alunoNota.nota) FROM AlunoNota alunoNota WHERE alunoNota.atividade IN (FROM Atividade a WHERE a.turma = :turma) AND alunoNota.aluno = :aluno");
		query.setParameter("turma", turma);
		query.setParameter("aluno", aluno);
		
		
		List<AlunoNota> listaAlunoNota = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(listaAlunoNota.isEmpty()) {
			return null;
		}
		
		return listaAlunoNota;
	}

}
