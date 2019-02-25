function filtrarTabelaNota() {

	var nomeAtividade = $('#pesquisarAtividade').val();
    			
	$.post('/educa-mais/atividade/filter', {
					
		'pesquisarAtividade' : nomeAtividade
					
	},function(dados) {
					
		var linhas = '';
					
		$(dados).each(function (i) {
						
			linhas += "<tr>";
	    	linhas += "<td style='vertical-align: middle; text-align: center;'>" + dados[i].nomeAtividade + "</td>";
	    	linhas += "<td style='vertical-align: middle; text-align: center;'>";
	    	linhas += converterData(dados[i].dataAtividade);
	    	linhas += "</td>";
	    	linhas += "<td style='vertical-align: middle; text-align: center;'>";
	    	linhas += "<a href='atividade/alterar?id="+dados[i].idAtividade+"'>Alterar</a>";
	    	linhas += "<br>";
	    	linhas += "<a href='atividade/remove?id="+dados[i].turma.idTurma+"&idAtividade="+dados[i].idAtividade+"'>Remover</a>";
	    	linhas += "</td>";
	    	linhas += "</tr>";
		});
					
		$('#tabelaAtividadeBody').html(linhas);
	});
}