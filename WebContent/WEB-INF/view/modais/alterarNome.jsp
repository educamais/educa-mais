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
				<form action="alterarnome" id="alterarNomeForm">
					<input type="hidden" name="idUsuario" value="${usuario.idUsuario}">
					<input type="hidden" name="idTurma" value="${turma.idTurma}">
					<input type="text" class="form-control" name="nome" placeholder="Digite o novo nome..." id="nome" required>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				<button type="button" class="btn btn-primary" id="btn_alterarNome">Alterar Nome</button>
			</div>
		</div>
	</div>
</div>