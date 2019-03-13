function cancelar(idPostagem) {
	    	$("#id_"+idPostagem).load(" #id_"+idPostagem);
	    }
	    
	    function alterarPostagem(idPostagem, idTurma, professor, listaAluno) {
	    	
	    	var content = $("#id_"+idPostagem).html();
	    	$("#id_"+idPostagem).html("<form action='/educa-mais/postagem/alterar' method='get' enctype='multipart/form-data'>"+content+"</form>");
	    	
	    	var titulo = $("#id_"+idPostagem+" #titulo_postagem").text();
	    	$("#id_"+idPostagem+" #titulo_postagem").html("<input type='text' class='form-control'  name='tituloPostagem' value='"+titulo.trim()+"'>");
	    	
	    	var descricao = $("#id_"+idPostagem+" #descricao_postagem").text();
	    	var linhas = "";
	    	
	    	linhas += '<input type="hidden" name="idPostagem" value="'+idPostagem+'">';
	    	linhas += '<input type="hidden" name="idTurma" value="'+idTurma+'">';
	    	linhas += '<input type="hidden" name="professor" value="'+professor+'">';
	    	
	    	linhas += "<textarea style='resize:none; width:100%;' name='descricaoPostagem' rows='5'>"+descricao.trim()+"</textarea>";
	    	linhas += '<div class="input-group my-3">';
	    	linhas += '<div class="custom-file">';
	    	linhas += '<input type="file" name="files" class="custom-file-input" id="inputGroupFile01" multiple>';
	    	linhas += '<label class="custom-file-label" for="inputGroupFile01">Selecionar arquivo</label>';
	    	linhas += '</div>';
	    	linhas += '</div>';
	    	
	    	$("#id_"+idPostagem+" #descricao_postagem").html(linhas);
	    	
	    	
	    	linhas = "";
	    	
	    	linhas += '<button type="button" class="btn btn-rosa btn-block" data-toggle="modal" data-target="#alterarAlunos">Lista de alunos</button>';
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
	    	listaAluno.forEach(function(item, index){
	    		linhas += '<input id="aluno_'+item+'" type="checkbox" name="alunos" value="${aluno.idUsuario}" checked>';
		    	linhas += '<label for="aluno_${ aluno.idUsuario }">${ aluno.nome }</label><br>';
	    	});
	    	linhas += '</div>';
					
	    	linhas += '<div class="modal-footer">';
	    	linhas += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>';
	    	linhas += '</div>';
	    	linhas += '</div>';
	    	linhas += '</div>';
	    	linhas += '</div>';
	    	
	    	
	    	$("#id_"+idPostagem+" .card-header").html('<div class="col-lx-6">'+linhas+'</div>');
	    	
	    	linhas = "<div class='row'>";
	    	linhas += "<div class='col-6'>";
	    	linhas += '<button id="btnCancelar" type="button" class="btn btn-block" onclick="cancelar('+idPostagem+')">Cancelar</button>';
	    	linhas += "</div>";
	    	linhas += "<div class='col-6'>";
	    	linhas += '<button id="btnAlterarMaterial" type="submit" class="btn btn-rosa btn-block">Publicar</button>';
	    	linhas += "</div>";
	    	linhas += "</div>";
	    	$("#id_"+idPostagem+" .card-footer").html(linhas);
	    }