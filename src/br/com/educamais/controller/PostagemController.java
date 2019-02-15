package br.com.educamais.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.educamais.model.AlunoPostagem;
import br.com.educamais.model.AlunoPostagemDao;
import br.com.educamais.model.AlunoTurmaDao;
import br.com.educamais.model.ArquivoPostagem;
import br.com.educamais.model.ArquivoPostagemDao;
import br.com.educamais.model.Postagem;
import br.com.educamais.model.PostagemDao;
import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;
import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;
import br.com.educamais.util.Util;

@Controller
public class PostagemController {

	@RequestMapping("postagem/save")
	public String salvar(@RequestParam("id") int idTurma, 
		@RequestParam("file") MultipartFile[] files, 
		@RequestParam("aluno") int[] idAlunos,
		Postagem post) {
		
		TurmaDao dao = new TurmaDao();
		Turma turma = dao.buscarPorId(idTurma);
		
		post.setTurma(turma);
		Date date = new Date();
		post.setDataPostagem(date);
		
		PostagemDao postDao = new PostagemDao();
		postDao.salvar(post);
		
		Postagem postagem = postDao.buscarPostagem(post);
		
		AlunoPostagemDao alunoPostagemDao = new AlunoPostagemDao();
		UsuarioDao usuarioDao = new UsuarioDao();
		
		for(int id : idAlunos) {
			Usuario aluno = usuarioDao.buscarPorId(id);
			alunoPostagemDao.salvar(aluno, postagem);
		}
		
		if(files.length != 0) {
			ArquivoPostagemDao arquivoPostagemDao = new ArquivoPostagemDao();
			for(MultipartFile file : files) {
				if (Util.fazerUploadImagem(file)) {
					String arquivo = Util.obterMomentoAtual() + " - " + file.getOriginalFilename();
					arquivoPostagemDao.salvar(post, arquivo);
				}
			}
		}
		
		return "redirect:/professor?id="+idTurma;
	}
	
	@RequestMapping("postagem/alterar")
	public String atualizar(@RequestParam("id") int idPostagem, Model model) {
				
		PostagemDao postagemDao = new PostagemDao();
		Postagem postagem = postagemDao.buscarPorId(idPostagem); 
		
		if(postagem != null) {
			
			AlunoTurmaDao alunoTurmaDao = new AlunoTurmaDao();
			List<Usuario> listaAlunosTurma = alunoTurmaDao.getListaAluno(postagem.getTurma());
			
			AlunoPostagemDao alunoPostagemDao = new AlunoPostagemDao();
			List<Usuario> listaAlunoPostagem = alunoPostagemDao.getListaAluno(postagem);
			
			ArquivoPostagemDao arquivoPostagemDao = new ArquivoPostagemDao();
			List<String> listaArquivo = arquivoPostagemDao.getListaArquivo(postagem);

			model.addAttribute("postagem", postagem);
			model.addAttribute("listaArquivo", listaArquivo);
			model.addAttribute("listaAlunoPostagem", listaAlunoPostagem);
			model.addAttribute("listaAlunosTurma", listaAlunosTurma);
			return "alterarPostagem";
		}
		model.addAttribute("link", "professor"+postagem.getTurma().getIdTurma());
		model.addAttribute("mensagem", "Esta Postagem não existe!");
		return "mensagem";
	}
	
	@RequestMapping("postagem/update")
	public String atualizar(@RequestParam("turma") int idTurma,
//			@RequestParam("file") MultipartFile[] files, 
			@RequestParam("aluno") int[] idAlunos,
			Postagem post, 
			HttpSession session) {
		
			Usuario usuario = (Usuario)session.getAttribute("usuario");
			
			PostagemDao postDao = new PostagemDao();
			postDao.atualizar(post);
			
//			AlunoPostagemDao alunoPostagemDao = new AlunoPostagemDao();
//			UsuarioDao usuarioDao = new UsuarioDao();
//			
//			for(int id : idAlunos) {
//				Usuario aluno = usuarioDao.buscarPorId(id);
//				AlunoPostagem alunoPostagem = alunoPostagemDao.buscarAlunoPostagem(aluno, post);
//				alunoPostagem.setPostagem(post);
//				alunoPostagemDao.atualizar(alunoPostagem);
//			}
//			
//			ArquivoPostagemDao arquivoPostagemDao = new ArquivoPostagemDao();
//			
//			for(MultipartFile file : files) {
//				if(arquivoPostagemDao.verificarExistencia(file.getOriginalFilename())) {
//					ArquivoPostagem arquivoPostagem = arquivoPostagemDao.buscaArquivoPostagem(post, file.getOriginalFilename());
//					arquivoPostagem.setPostagem(post);
//					arquivoPostagemDao.atualizar(arquivoPostagem);
//				}else {
//					if (Util.fazerUploadImagem(file)) {
//						String arquivo = Util.obterMomentoAtual() + " - " + file.getOriginalFilename();
//						arquivoPostagemDao.salvar(post, arquivo);
//					}
//				}
//			}
			
			return "redirect:/professor?id="+idTurma;
		}
	
	@RequestMapping("postagem/remove")
	public String remover(@RequestParam("id") int idPostagem) {
		
		PostagemDao daoPostagem = new PostagemDao();
		Postagem postagem = daoPostagem.buscarPorId(idPostagem);
		int idTurma = postagem.getTurma().getIdTurma();
		
		ArquivoPostagemDao daoArquivoPostagemDao = new ArquivoPostagemDao();
		daoArquivoPostagemDao.remover(postagem);
		
		AlunoPostagemDao daoAlunoPostagem = new AlunoPostagemDao();
		daoAlunoPostagem.remover(postagem);
		
		daoPostagem.remover(idPostagem);
		
		return "redirect:/professor?id="+idTurma;
	}
}