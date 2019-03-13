<div class="modal fade" id="participar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header bg-one text-white">
				<h5 class="modal-title" id="exampleModalLabel">Participar da Turma</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<form id="formParticipar" method="post" action="/educa-mais/turma/participar">
					<input type="text" class="form-control w-100" name="codigo" placeholder="Digite o código da turma..." required>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				<button type="button" class="btn btn-three" id="btn_participar">Participar</button>
			</div>

		</div>
	</div>
</div>