package br.com.educamais.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioDao {
	
	public boolean verificarExistencia(String email, String senha) {
		
		//Conexão
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("educa-mais");
		EntityManager manager = factory.createEntityManager();
		
		Query query = null;
		List<Usuario> result = null;
		
		email = email != null ? email : "";
		senha = senha != null ? senha : "";
		
		if(!email.equals("") && !senha.equals("")) {
			
			//Consulta
			manager.getTransaction().begin();
			query = manager.createQuery("FROM Usuario WHERE email = :email AND senha = :senha");
			query.setParameter("email", email);
			query.setParameter("senha", senha);
			
			//Resultado
			result = query.getResultList();
		}
		
		//Encerrando conexão
		manager.close();
		factory.close();
		
		//Se tiver resultado pode logar
		if(result.size() == 1 ) {
			return true;
		}
		
		//Caso contrário, não poderá
		return false;
	}
}
