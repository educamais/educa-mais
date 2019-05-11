<div class="modal fade" id="alterarSenha" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title">Alterar Senha</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<form action="/educa-mais/alterarsenha" id="formularioAlterarSenha">
					<input type="hidden" name="idUsuario" value="${usuario.idUsuario}">
					<input type="hidden" name="idTurma" value="${turma.idTurma}">
					
					<div class="input-group mb-3">
						<input type="password" class="form-control w-75" name="senhaAtual" placeholder="Digite sua senha atual..." id="senhaAtual" required>
					</div>
					
					<div class="input-group mb-3">
						<input type="password" class="form-control w-75" name="senhaNova" placeholder="Digite sua nova senha..." id="senhaNova" required>
					</div>
					
					<div class="input-group mb-3">
						<input type="password" class="form-control w-75" name="redigiteSenha" placeholder="Redigite sua nova senha..." id="redigiteSenha" required>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				<button type="submit" class="btn" id="btn_alterarSenha" onclick="submeter('#formularioAlterarSenha')">Alterar Senha</button>
			</div>
		</div>
	</div>
</div>