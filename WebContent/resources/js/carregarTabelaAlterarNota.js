function carregaTabelaAlterarNota(idAtividade) {
	
	$.post("/educa-mais/atividade/listagem",{
		"idAtividade" : idAtividade
	}, function(alunosNota){
		
		var linhas = '';
		linhas += "<form action='/educa-mais/atividade/alterar'>"
		linhas += "<input type='hidden' name='idTurma' value='"+alunosNota[0].atividade.turma.idTurma+"'>";
		linhas += "<table  class='table table-striped'>";
		linhas += "<thead class='bg-two text-white'>";
		linhas += "<tr>";
		linhas += "<th scope='col'>Nome</th>";
		linhas += "<th scope='col'>Nota</th>";
		linhas += "</tr>";
		linhas += "</thead>";
		linhas += "<tbody id='tabelaAtividadeBody'>";
		
		$(alunosNota).each(function (i) {
						
			linhas += "<tr>";
	    	linhas += "<td style='vertical-align: middle;'>"+alunosNota[i].aluno.nome+"</td>";
	    	linhas += "<td>";
	    	linhas += "<input class='form-input form-control' type='hidden' name='idAlunoNota' value='"+alunosNota[i].idAlunoNota+"'>";
	    	linhas += "<input class='form-input form-control' type='number' max='999999999' name='nota' value='"+alunosNota[i].nota+"'>";
	    	linhas += "</td>";
	    	linhas += "</tr>";
		});
		linhas += "</tbody>";
		linhas += "</table>";
		linhas += "<button id='btnAlterar' class='btn btn-three my-2 mr-1' type='submit'>Alterar</button>";
		linhas += "<button id='btnVoltar' class='btn btn-secondary my-2' type='button' onclick='carregaDiv()'>Cancelar</button>";
		linhas += "</form>"
		$("#crudAtividade").html(linhas);
	});
}