function filtrarTabelaRanking() {

	var pesquisarNome = $('#pesquisarNome').val();
	var idTurma = $('#idTurma').val();
    
	console.log(pesquisarNome + " - " + idTurma);
	
	$.post('/educa-mais/ranking/filter', {
					
		'pesquisarNome' : pesquisarNome,
		'idTurma' : idTurma
					
	},function(dados) {
			
		console.log(dados);
		var linhas = '';
					
		$(dados).each(function (i) {
			
			linhas += "<tr>";
	    	linhas += "<td>"+ dados[i][0].nome +"</td>";
	    	linhas += "<td>"+ dados[i][1].toFixed(1) +"</td>";
	    	linhas += "</tr>";
		});
					
		$('#ranking').html(linhas);
	});
}