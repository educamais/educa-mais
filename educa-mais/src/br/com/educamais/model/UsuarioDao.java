package br.com.educamais.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UsuarioDao {
	
	private static final String PERSISTENCE_UNIT = "educa-mais";
	
	public boolean verificarExistencia(String email, String senha) {
		
		//Conexão
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
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
	
	public int salvar(Usuario usuario, String confirmarSenha) {
		
		//Conexão
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		String nome = usuario.getNome() != null ? usuario.getNome() : "";
		String email = usuario.getEmail() != null ? usuario.getEmail() : "";
		String senha = usuario.getSenha() != null ? usuario.getSenha() : "";
		
		if(nome == "" || email == "" || senha == "") {
			return 1;
		}
		
		//Verificar se já existe um registro no banco
		if ( verificarExistencia(usuario.getEmail(), usuario.getSenha()) ) {
			return 2;
		}
		
		//Inclusão no banco
		manager.getTransaction().begin();
		manager.persist(usuario);
		manager.getTransaction().commit();
		
		//Encerramento de conexão
		manager.close();
		factory.close();
		
		return 0;
	}
}
