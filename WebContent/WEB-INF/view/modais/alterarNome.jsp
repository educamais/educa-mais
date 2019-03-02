<div class="modal fade" id="alterarNome" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Alterar Nome</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<form action="/educa-mais/alterarnome" id="alterarNomeForm">
					<input type="hidden" name="idUsuario" value="${usuario.idUsuario}">
					<input type="hidden" name="idTurma" value="${turma.idTurma}">
					<div class="input-group mb-3">
						<input id="nome" type="text" class="form-control w-75" name="nome" placeholder="Digite seu nome..." id="nome" required>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="submit" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				<button type="submit" class="btn btn-primary" id="btn_alterarNome">Alterar Nome</button>
			</div>
		</div>
	</div>
</div>