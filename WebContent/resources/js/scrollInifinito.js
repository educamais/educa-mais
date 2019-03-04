function scrollInfinito(idTurma) {
	
	
    $(window).scroll(function () {
    	
    	var inicio = $(".card").length;
    	
        if ($(window).scrollTop() >= $(document).height() - $(window).height() - 10) {
	
            $.get("/educa-mais/postagem",{
            	"idTurma" : idTurma,
            	'inicio' : inicio
            },function(postagem){
            	
            	$(postagem).each(function (i) {
            		
            		var linhas = '';
            		linhas += '<div class="mb-3" id="id_'+postagem[i].idPostagem+'">';
            		linhas += '<ul class="nav nav-tabs">';
            		linhas += '<li class="nav-item">';
            		linhas += '<a class="nav-link active border font-weight-bold bg-azulc text-white" style="font-family:Gravity;" data-toggle="tab" id="titulo_postagem">';
            		linhas += postagem[i].tituloPostagem;
            		linhas += '</a>';
            		linhas += '</li>';
            		linhas += '</ul>';
                    
            		linhas += '<div class="card gedf-card">';
            		linhas += '<div class="card-body"  id="descricao_postagem">';
            		linhas += '<div class="float-right">';
            		linhas += '<button type="button" class="btn btn-link dropdown-toggle p-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
            		linhas += '<i class="fa fa-ellipsis-h"></i>';
            		linhas += '</button>';
            		linhas += '<div class="dropdown-menu">';
            		linhas += '<button class="btn btn-link dropdown-item" type="button" onclick="alterarPostagem('+postagem[i].idPostagem+', '+idTurma+', '+postagem[i].turma.professor.idUsuario+')">Editar</button>';
            		linhas += '<div class="dropdown-divider"></div>';
            		linhas += '<a class="dropdown-item" href="/educa-mais/postagem/remove?id='+postagem[i].idPostagem+'">Excluir</a>';
            		linhas += '</div>';
            		linhas += '</div>';
            		linhas += '<div class="row">';
            		linhas += '<div class="p-1">';
            		linhas += '<p class="card-text">';
            		linhas += postagem[i].descricaoPostagem;
            		linhas += '</p>';
            		linhas += '</div>';
            		linhas += '</div>';
            		linhas += '<div class="row">';
                            
//                    if (postagem[i].listaArquivo.length > 0){
//                  	
//                    	postagem.listaArquivo.each(function(index, value){
//                    		linhas += '<div class="col-6 col-lg-2 mb-1">';
//                    		if(value.arquivo.endsWith('.png') || value.arquivo.endsWith('.jpg') || value.arquivo.endsWith('.jpeg')){
//                    			linhas += '<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">';
//                    				linhas += '<img src="<%=request.getContextPath()%>/resources/img/image.png" class="img-fluid img-thumbnail">';
//                    			linhas += '</a>';
//                           	} else if(value.arquivo.endsWith('.pdf') || value.arquivo.endsWith('.doc') || value.arquivo.endsWith('.docx') || value.arquivo.endsWith('.odt') || value.arquivo.endsWith('.xlsx') || value.arquivo.endsWith('.ods') || value.arquivo.endsWith('.pptx') || value.arquivo.endsWith('.ppt') || value.arquivo.endsWith('.odp')){
//                           		linhas += '<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">';
//                               		linhas += '<img src="<%=request.getContextPath()%>/resources/img/doc.png" class="img-fluid img-thumbnail">';
//                               	linhas += '</a>';
//                            } else {
//                            	linhas += '<a href="<%=request.getContextPath()%>/resources/img/upload/${arquivo.arquivo}" download="${arquivo.arquivo}">';
//                            		linhas += '<img src="<%=request.getContextPath()%>/resources/img/docUnknow.png" class="img-fluid img-thumbnail">';
//                            	linhas += '</a>';
//                            }
//                    		linhas += '</div>';
//                    	});
//                    }
                    linhas += '</div>';
                    linhas += '</div>';
                    linhas += '</div>';
                    linhas += '</div>';
                    $("#feed").append(linhas);
                    
            	});
            });
        }
    });
}