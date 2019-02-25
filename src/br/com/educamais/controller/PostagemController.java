package br.com.educamais.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import br.com.educamais.model.AlunoPostagem;
import br.com.educamais.model.AlunoPostagemDao;
import br.com.educamais.model.AlunoTurmaDao;
import br.com.educamais.model.ArquivoPostagem;
import br.com.educamais.model.ArquivoPostagemDao;
import br.com.educamais.model.Atividade;
import br.com.educamais.model.AtividadeDao;
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
		
		return "redirect:/professor/mural?id="+idTurma;
	}
	
	@RequestMapping("postagem/alterar")
	public String atualizar(@RequestParam int idPostagem, @RequestParam String tituloPostagem, @RequestParam String descricaoPostagem, @RequestParam int idTurma, @RequestParam int professor, @RequestParam Integer[] alunos,Model model) {
				
		PostagemDao postagemDao = new PostagemDao();
		
		Postagem postagem = postagemDao.buscarPorId(idPostagem);
		postagem.setTituloPostagem(tituloPostagem);
		postagem.setDescricaoPostagem(descricaoPostagem);
		
		
		if(postagem != null) {
			AlunoPostagemDao alunoPostagemDao = new AlunoPostagemDao();
				
			alunoPostagemDao.remover(postagem);
			
			UsuarioDao usuarioDao = new UsuarioDao();
			for(Integer id : alunos) {
				if(id != null) {
					Usuario aluno = usuarioDao.buscarPorId(id);
					alunoPostagemDao.salvar(aluno, postagem);
				}
			}
			
			postagemDao.atualizar(postagem);
			return "redirect:/professor/mural?id="+idTurma;
		}
		model.addAttribute("link", "professor"+postagem.getTurma().getIdTurma());
		model.addAttribute("mensagem", "Esta Postagem não existe!");
		return "mensagem";
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
		
		return "redirect:/professor/mural?id="+idTurma;
	}
	
	@RequestMapping(value = "/postagem", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String filter(@RequestParam int idTurma, @RequestParam String atual, @RequestParam int limite) {
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		PostagemDao postagemDao = new PostagemDao();
		List<Postagem> listaPostagem = postagemDao.getListaPostagem(turma);
		
		return new Gson().toJson(listaPostagem);
	}
}
