package br.com.educamais.controller;


import java.util.ArrayList;
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

import com.google.gson.GsonBuilder;

import br.com.educamais.model.AlunoPostagemDao;
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
		Postagem post,
		HttpSession session,
		Model model) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao dao = new TurmaDao();
		Turma turma = dao.buscarPorId(idTurma);
		
		if(turma != null) {
			if(usuario.getIdUsuario() == turma.getProfessor().getIdUsuario()) {
				
				post.setTurma(turma);
				Date date = new Date();
				post.setDataPostagem(date);
				
				PostagemDao postDao = new PostagemDao();
				postDao.salvar(post, idAlunos, files);
		
				return "redirect:/professor/mural?id="+idTurma;
			}
			model.addAttribute("link", "usuario");
			model.addAttribute("mensagem", "Você não é professor dessa turma!");
			return "mensagem";
		}
		model.addAttribute("link", "usuario");
		model.addAttribute("mensagem", "Esta turma não existe!");
		return "mensagem";
	}
	
	@RequestMapping("postagem/alterar")
	public String atualizar(Postagem postagem, @RequestParam int idTurma, @RequestParam Integer[] alunos, @RequestParam List<MultipartFile> files, Model model) {
				
		PostagemDao postagemDao = new PostagemDao();
		postagem.setDataPostagem(postagemDao.buscarPorId(postagem.getIdPostagem()).getDataPostagem());
		postagem.setTurma(postagemDao.buscarPorId(postagem.getIdPostagem()).getTurma());
		
		{
			AlunoPostagemDao alunoPostagemDao = new AlunoPostagemDao();
				
			alunoPostagemDao.remover(postagem);
			
			UsuarioDao usuarioDao = new UsuarioDao();
			for(Integer id : alunos) {
				if(id != null) {
					Usuario aluno = usuarioDao.buscarPorId(id);
					alunoPostagemDao.salvar(aluno, postagem);
				}
			}
			
			if(files.size() > 0) {
				ArquivoPostagemDao arquivoPostagemDao = new ArquivoPostagemDao();
				arquivoPostagemDao.remover(postagem);
				
				List<ArquivoPostagem> listaArquivoPostagem = new ArrayList<>();
				
				for(MultipartFile file : files) {
					if (Util.fazerUploadImagem(file)) {
						String arquivo = Util.obterMomentoAtual() + " - " + file.getOriginalFilename();
						listaArquivoPostagem.add(arquivoPostagemDao.salvar(postagem, arquivo));
					}
				}
				postagem.setListaArquivo(listaArquivoPostagem);
			}
			
			postagemDao.atualizar(postagem);
			return "redirect:/professor/mural?id="+idTurma;
		}
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
	public @ResponseBody String filter(@RequestParam int idTurma, @RequestParam int inicio) {
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		PostagemDao postagemDao = new PostagemDao();
		List<Postagem> listaPostagem = postagemDao.getListaPostagem(turma, inicio);
		
		return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(listaPostagem);
	}
	
	@RequestMapping(value = "/alunopostagem", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String alunofilter(@RequestParam int idTurma, @RequestParam int inicio, HttpSession session) {
		
		Usuario usuario = (Usuario)session.getAttribute("usuario");
		
		TurmaDao turmaDao = new TurmaDao();
		Turma turma = turmaDao.buscarPorId(idTurma);
		
		AlunoPostagemDao alunoPostagemDao = new AlunoPostagemDao();
		List<Postagem> listaPostagem = alunoPostagemDao.getListaPostagem(usuario, turma, inicio);
		
		return new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(listaPostagem);
	}
}
