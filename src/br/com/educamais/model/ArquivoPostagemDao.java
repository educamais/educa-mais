package br.com.educamais.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.web.multipart.MultipartFile;

public class ArquivoPostagemDao {

	private static final String PERSISTENCE_UNIT = "educa-mais";

	public ArquivoPostagem salvar(Postagem postagem, String arquivo) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		
		ArquivoPostagem arquivoPostagem = new ArquivoPostagem();
		
		arquivoPostagem.setPostagem(postagem);
		arquivoPostagem.setArquivo(arquivo);
		
		manager.getTransaction().begin();
		manager.persist(arquivoPostagem);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
		
		return arquivoPostagem;
	}
	
	public void remover(Postagem postagem){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM ArquivoPostagem WHERE postagem = :paramPostagem");
		query.setParameter("paramPostagem", postagem);
		
		manager.getTransaction().begin();
		
		List<ArquivoPostagem> result = query.getResultList();
		
		for(ArquivoPostagem alunoPostagem : result) {
			manager.remove(alunoPostagem);
		}

		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}

	public void atualizar(ArquivoPostagem arquivoPostagem) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		manager.getTransaction().begin();
		manager.merge(arquivoPostagem);
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
	
	public List<String> getListaArquivo(Postagem postagem){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM ArquivoPostagem WHERE postagem = :paramPostagem");
		query.setParameter("paramPostagem", postagem);
		
		List<ArquivoPostagem> result = query.getResultList();
		
		manager.close();
		factory.close();
		
		List<String> listaArquivo = new ArrayList<String>();
			
		for(ArquivoPostagem alunoPostagem : result) {
			String arquivo = alunoPostagem.getArquivo();
			listaArquivo.add(arquivo);
		}
		return listaArquivo;
	}
	
	public List<ArquivoPostagem> getListaArquivoPostagem(Postagem postagem){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM ArquivoPostagem WHERE postagem = :paramPostagem");
		query.setParameter("paramPostagem", postagem);
		
		List<ArquivoPostagem> listaArquivoPostagem = query.getResultList();
		
		manager.close();
		factory.close();
		
		if(listaArquivoPostagem.isEmpty()) {
			return null;
		}
		
		return listaArquivoPostagem;
	}

	public boolean verificarExistencia(String arquivo) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM ArquivoPostagem WHERE arquivo = :paramArquivo");
		query.setParameter("paramArquivo", arquivo);
		
		manager.getTransaction().begin();
		List<ArquivoPostagem> result = query.getResultList();
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
		
		if(result.isEmpty()) {
			return false;
		}
		
		return true;
	}

	public ArquivoPostagem buscaArquivoPostagem(Postagem postagem, String arquivo) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		
		Query query = manager.createQuery("FROM ArquivoPostagem WHERE postagem = :paramPostagem AND arquivo = :paramArquivo");
		query.setParameter("paramPostagem", postagem);
		query.setParameter("paramArquivo", arquivo);
		
		manager.getTransaction().begin();
		List<ArquivoPostagem> result = query.getResultList();
		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
		
		if(result.isEmpty()) {
			return null;
		}
		
		return result.get(0);
	}
}
