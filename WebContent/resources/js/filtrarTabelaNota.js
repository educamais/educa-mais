function filtrarTabelaNota() {

	var nomeAtividade = $('#pesquisarAtividade').val();
	var idTurma = $('#idTurma').val();
    			
	$.post('/educa-mais/atividade/filter', {
					
		'pesquisarAtividade' : nomeAtividade,
		'idTurma' : idTurma
					
	},function(dados) {
					
		var linhas = '';
					
		$(dados).each(function (i) {
						
			linhas += "<tr>";
	    	linhas += "<td style='vertical-align: middle;'>" + dados[i].nomeAtividade + "</td>";
	    	linhas += "<td style='vertical-align: middle;'>";
	    	linhas += converterData(dados[i].dataAtividade);
	    	linhas += "</td>";
	    	linhas += "<td style='vertical-align: middle; text-align: center;'>";
	    	linhas += '<button class="btn btn-link collapsed" type="button" onclick="carregarTabelaAlterarNota('+dados[i].idAtividade+')" data-toggle="collapse" data-target="#id_'+dados[i].idAtividade+'" aria-expanded="false">Alterar</button>';
	    	linhas += "<br>";
	    	linhas += "<a href='/educa-mais/atividade/remove?id="+dados[i].turma.idTurma+"&idAtividade="+dados[i].idAtividade+"'>Remover</a>";
	    	linhas += "</td>";
	    	linhas += "</tr>";
		});
					
		$('#tabelaAtividadeBody').html(linhas);
	});
}