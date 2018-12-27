package br.com.educamais.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioDao {
	
	public boolean autenticar(String email, String senha) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("educa-mais");
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		
		manager.getTransaction().begin();
		query = manager.createQuery("FROM Usuario WHERE email = :email AND senha = :senha");
		query.setParameter("email", email);
		query.setParameter("senha", senha);
		
		List<Usuario> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(result.size() == 1 ) {
			return true;
		}
		
		return false;
	}
}
