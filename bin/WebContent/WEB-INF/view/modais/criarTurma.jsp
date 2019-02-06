<div class="modal fade" id="criarTurma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Título do modal</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<form id="formCriarSala" method="post" action="turma/save">
					<input type="text" class="form-control" name="nomeTurma" placeholder="Digite o nome da turma..." required>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				<button type="button" class="btn btn-primary" id="btn_criarTurma">Criar Turma</button>
			</div>
		</div>
	</div>
</div>