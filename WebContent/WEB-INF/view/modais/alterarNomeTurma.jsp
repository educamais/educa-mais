<div class="modal fade" id="alterarNomeTurma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header bg-one text-white">
				<h5 class="modal-title" id="exampleModalLabel">Alterar Nome da Turma</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body bg-one text-white">
				<form action="/educa-mais/alterarnome" id="alterarNomeTurmaForm">
					<input type="hidden" name="idUsuario" value="${usuario.idUsuario}">
					<input type="hidden" name="idTurma">
					<div class="input-group mb-3">
						<input id="nome" type="text" class="form-control w-75" name="nomeTurma" placeholder="Digite seu nome..." id="nome" required>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="submit" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				<button type="submit" class="btn btn-three" id="btn_alterarNomeTurma">Alterar Nome</button>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#btn_alterarNomeTurma").click(function() {
		$("#alterarNomeTurmaForm #idTurma").val();
		$("#alterarNomeTurmaForm").submit();
	});
});
</script>