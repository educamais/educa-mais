package br.com.educamais.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";

	public Usuario verificarExistencia(Usuario usuario) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		Query query = null;

		String email = usuario.getEmail() != null ? usuario.getEmail() : "";
		String senha = usuario.getSenha() != null ? usuario.getSenha() : "";
		
		if (!email.equals("") && !senha.equals("")) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Usuario WHERE email = :email AND senha = :senha");
			query.setParameter("email", email);
			query.setParameter("senha", senha);
			
		}else if(!email.equals("") && senha.equals("")) {
			
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Usuario WHERE email = :email");
			query.setParameter("email", email);
		}

		List<Usuario> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if (result.size() == 0) {
			return null;
		}
		
		usuario = result.get(0);
		
		return usuario;

	}

	public void salvar(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(usuario);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
	
	public void atualizar(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(usuario);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
	
	public Usuario buscarPorId(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		Usuario usuario = manager.find(Usuario.class, id);
		
		manager.close();
		factory.close();
		
		return  usuario;
	}
}
