function retornaTabela() {
	
	$.post("atividade/filter",{
		"pesquisarAtividade" : ""
	}, function(atividade){
		
		var linhas = '';
		linhas += "<table class='table table-striped' id='tabelaAtividade'>";
		linhas += "<thead>";
		linhas += "<tr>";
		linhas += "<th scope='col'>Nome</th>";
		linhas += "<th scope='col'>Data</th>";
		linhas += "<th scope='col' style='vertical-align: middle; text-align: center;'>Operação</th>";
		linhas += "</tr>";
		linhas += "</thead>";
		linhas += "<tbody id='tabelaAtividadeBody'>";
		
		$(atividade).each(function (i) {
		
			linhas += "<tr>";
			linhas += "<td style='vertical-align: middle;'>"+atividade[i].nomeAtividade+"</td>";
			linhas += "<td style='vertical-align: middle;'><fmt:formatDate value='"+atividade[i].dataAtividade+"' pattern='dd/MM/yyyy' /></td>";
			linhas += "<td style='vertical-align: middle; text-align: center;'>";
			linhas += "<button class='btn btn-link collapsed' type='button' onclick='carregarTabelaAlterarNota("+atividade[i].idAtividade+")' data-toggle='collapse' data-target='#id_${atividade.idAtividade}' aria-expanded='false'> Alterar </button>";
			linhas += "<br>";
			linhas += "<a href='atividade/remove?id="+atividade[i].turma.idTurma+"&idAtividade="+atividade[i].idAtividade+"'>Remover</a>";
			linhas += "</td>";
			linhas += "</tr>";
		});
		
		linhas += "</tbody>";
		linhas += "</table>";
		
		$("#crudAtividade").html(linhas);
	});
}