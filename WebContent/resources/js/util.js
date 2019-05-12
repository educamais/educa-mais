function submeter(id_formulario) {
	$(id_formulario).submit();
}

function alterarPostagem(idPostagem, idTurma, professor) {
	
	var conteudoFormulario = $("#postagem_"+idPostagem).html();
	$("#postagem_"+idPostagem).html("<form action='/educa-mais/postagem/alterar' id='formAlterarPostagem' method='post' enctype='multipart/form-data'>"+conteudoFormulario+"</form>");
	
	adicionarCampoTitulo(idPostagem)
	adicionarModalAluno(idPostagem)
	adicionarCampoDescricao(idPostagem)
	adicionarCamposHidden(idPostagem, idTurma, professor)
	adicionarBotoes(idPostagem)	
}

function adicionarCampoTitulo(idPostagem) {
	var titulo = $("#postagem_"+idPostagem+" .tituloPostagem").text();
	$("#postagem_"+idPostagem+" .tituloPostagem").html("<input type='text' class='form-control'  name='tituloPostagem' value='"+titulo.trim()+"'>");
}

function adicionarModalAluno(idPostagem) {
	
	var linhas = "";
	
	linhas += "<div class='card-header'>";
	linhas += "<div class='col-lx-6'>";
	linhas += '<button type="button" class="btn  btn-block" data-toggle="modal" data-target="#alterarAlunos">Lista de alunos</button>';
	linhas += '<div class="modal fade" id="alterarAlunos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">';
	linhas += '<div class="modal-dialog" role="document">';
	linhas += '<div class="modal-content">';

	linhas += '<div class="modal-header">';
	linhas += '<h5 class="modal-title" id="exampleModalLabel">Alunos</h5>';
	linhas += '<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">';
	linhas += '<span aria-hidden="true">&times;</span>';
	linhas += '</button>';
	linhas += '</div>';
	linhas += '<div class="modal-body">';
	linhas += '<c:forEach var="aluno" items="${ listaAluno }">';
	linhas += '<input id="aluno_${ aluno.idUsuario }" type="checkbox" class="checkbox" name="alunos" value="${aluno.idUsuario}" checked>';
	linhas += '<label for="aluno_${ aluno.idUsuario }">${ aluno.nome }</label><br>';
	linhas += '</c:forEach>';
	linhas += '</div>';
			
	linhas += '<div class="modal-footer">';
	linhas += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>';
	linhas += '</div>';
	linhas += '</div>';
	linhas += '</div>';
	linhas += '</div>';
	linhas += '</div>';
	linhas += '</div>';
	
	$("#postagem_"+idPostagem+" .card").prepend(linhas);
}

function adicionarCamposHidden(idPostagem, idTurma, professor) {
	
	var linhas = "";
	linhas += '<input type="hidden" name="idPostagem" value="'+idPostagem+'">';
	linhas += '<input type="hidden" name="idTurma" value="'+idTurma+'">';
	linhas += '<input type="hidden" name="professor" value="'+professor+'">';
	
	$("#postagem_"+idPostagem+" .card").prepend(linhas);
}

function adicionarCampoDescricao(idPostagem) {

	var descricao = $("#postagem_"+idPostagem+" .descricaoPostagem .card-text").text();
	var linhas = "";
	
	linhas += "<textarea style='resize:none;width:100%' name='descricaoPostagem' rows='5'>"+descricao.trim()+"</textarea>";
	linhas += '<div class="input-group my-3">';
	linhas += '<div class="custom-file">';
	linhas += '<input type="file" name="files" class="custom-file-input" id="arquivos" multiple>';
	linhas += '<label class="custom-file-label" for="arquivos">Selecionar arquivo</label>';
	linhas += '</div>';
	linhas += '</div>';
	
	$("#postagem_"+idPostagem+" .descricaoPostagem").html(linhas);
}

function adicionarBotoes(idPostagem) {
	var linhas = "";
	linhas = '<div class="card-footer">';
	linhas += "<div class='row'>";
	linhas += "<div class='col-6'>";
	linhas += '<button id="btnCancelar" type="button" class="btn btn-block" onclick="cancelar('+idPostagem+')">Cancelar</button>';
	linhas += "</div>";
	linhas += "<div class='col-6'>";
	linhas += '<button id="btnPublicar" type="button" onclick="validaAluno()" class="btn  btn-block">Publicar</button>';
	linhas += "</div>";
	linhas += "</div>";
	linhas += "</div>";
	$("#postagem_"+idPostagem+" .card").append(linhas);
}

function cancelar(idPostagem) {
	$("#postagem_"+idPostagem).load(" #postagem_"+idPostagem);
}

function carregarPostagens(idTurma, page, path) {
	
	if($(".feed").length >= page){
		
		$.get("/educa-mais/postagem",{
			"idTurma" : idTurma,
			'inicio' : page
		},function(postagem){
			
			$(postagem).each(function (i) {
				
				let idPostagem = postagem[i].idPostagem;
				let titulo = adicionarTitulo(postagem[i]);
				let descricao = adicionarDescricao(postagem[i]);
				let arquivos = adicionarArquivos(postagem[i], path);
				
				let postagemNova = encapsularPostagem(idPostagem, titulo, descricao, arquivos);
				
				if($("#feed:last")){
					$("#feed").append(postagemNova);
				}
			});
		});
	}
}

function encapsularPostagem(idPostagem, titulo, descricao, arquivos) {
	
	var linhas = '';
	linhas += '<div class="mb-3 feed" id="id_'+idPostagem+'">';
	
	linhas += titulo;
	
	linhas += '<div class="card gedf-card">';
	linhas += '<div class="card-body"  id="descricao_postagem">';
	
	linhas += descricao;
	linhas += arquivos;
	
	linhas += '</div>';
	linhas += '</div>';
	linhas += '</div>';
	
	return linhas;
}

function adicionarTitulo(postagem) {
	var linhas = "";
	linhas += '<ul class="nav nav-tabs">';
	linhas += '<li class="nav-item">';
	linhas += '<a class="nav-link active border font-weight-bold" data-toggle="tab" id="titulo_postagem">';
	linhas += postagem.tituloPostagem;
	linhas += '</a>';
	linhas += '</li>';
	linhas += '</ul>';
	
	return linhas;
}

function adicionarDescricao(postagem) {
	
	var linhas = "";
	linhas += '<div class="float-right">';
	linhas += '<button type="button" class="btn  btn-link dropdown-toggle p-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
	linhas += '<i class="fa fa-ellipsis-h"></i>';
	linhas += '</button>';
	linhas += '<div class="dropdown-menu">';
	linhas += '<button class="btn btn-link dropdown-item" type="button" onclick="alterarPostagem('+postagem.idPostagem+', '+postagem.turma.idTurma+', '+postagem.turma.professor.idUsuario+')">Editar</button>';
	linhas += '<div class="dropdown-divider"></div>';
	linhas += '<a class="dropdown-item" href="/educa-mais/postagem/remove?id='+postagem.idPostagem+'">Excluir</a>';
	linhas += '</div>';
	linhas += '</div>';
	linhas += '<div class="row">';
	linhas += '<div class="p-1">';
	linhas += '<p class="card-text">';
	linhas += postagem.descricaoPostagem;
	linhas += '</p>';
	linhas += '</div>';
	linhas += '</div>';
	
	return linhas
}

function adicionarArquivos(postagem, path){
	
	var linhas = "";
	linhas += '<div class="row">';
	
	postagem.listaArquivo.forEach(function(arquivo){
		
		linhas += '<div class="col-6 col-lg-2 mb-1">';
		
		if(arquivo.arquivo.endsWith('.png') || arquivo.arquivo.endsWith('.jpg') || arquivo.arquivo.endsWith('.jpeg')){
			linhas += "<a href='"+path+"/resources/img/upload/"+arquivo.arquivo+"' download='"+arquivo.arquivo+"'>";
			linhas += '<img src="'+path+'/resources/img/image.png" class="img-fluid img-thumbnail">';
			linhas += '</a>';
	   	} else if(arquivo.arquivo.endsWith('.pdf') || arquivo.arquivo.endsWith('.doc') || arquivo.arquivo.endsWith('.docx') || arquivo.arquivo.endsWith('.odt') || arquivo.arquivo.endsWith('.xlsx') || arquivo.arquivo.endsWith('.ods') || arquivo.arquivo.endsWith('.pptx') || arquivo.arquivo.endsWith('.ppt') || arquivo.arquivo.endsWith('.odp')){
	   		linhas += '<a href="'+path+'/resources/img/upload/'+arquivo.arquivo+'" download="'+arquivo.arquivo+'">';
		   	linhas += '<img src="'+path+'/resources/img/doc.png" class="img-fluid img-thumbnail">';
		   	linhas += '</a>';
		} else {
			linhas += '<a href="'+path+'/resources/img/upload/'+arquivo.arquivo+'" download="'+arquivo.arquivo+'">';
			linhas += '<img src="'+path+'/resources/img/docUnknow.png" class="img-fluid img-thumbnail">';
			linhas += '</a>';
		}
		linhas += '</div>';
	});
	
	linhas += '</div>';
	
	return linhas;
}