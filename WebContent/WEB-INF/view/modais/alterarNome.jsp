<div class="modal fade" id="alterarNome" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title">Alterar Nome</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<form action="/educa-mais/alterarnome" id="formularioAlterarNome">
					<input type="hidden" name="idUsuario" value="${usuario.idUsuario}">
					<input type="hidden" name="idTurma" value="${turma.idTurma}">
					<div class="input-group mb-3">
						<input id="nome" class="form-control w-75" name="nome" type="text" placeholder="Digite seu nome..." required>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="submit" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				<button type="submit" class="btn" id="btn_alterarNome" onclick="submeter('#formularioAlterarNome')">Alterar Nome</button>
			</div>
		</div>
	</div>
</div>