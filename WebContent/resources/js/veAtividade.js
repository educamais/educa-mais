function veAtividade(idAtividade){
    			
	$.post('/educa-mais/atividade/alunos', {
					
		'idAtividade' : idAtividade
					
	},function(aluno) {
		
		var soma = 0;
		var linhas = '';
		
		$(aluno).each(function (i) {
			
			soma += aluno[i].nota;
			
			linhas += "<tr id='tr_"+idAtividade+"'>";
	    	linhas += "<td colspan='2' style='vertical-align: middle;'>"+aluno[i].aluno.nome.toUpperCase()+"</td>";
	    	linhas += "<td >"+aluno[i].nota+"</td>";
	    	linhas += "</tr>";
		});
		
		$('#tr_'+idAtividade).html(linhas);
		$('#atividade_'+idAtividade+' #desempenhoAtividadeMedia').text(soma/aluno.length);
		$('#atividade_'+idAtividade+' #desempenhoAtividadeTotal').text(soma);
	});
					
	
}