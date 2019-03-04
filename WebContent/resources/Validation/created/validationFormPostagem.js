$(document).ready(function(){
	
	$("#cadPostagem").validate({
        rules : {
        	tituloPostagem : {
        		required : true,
        		rangelength : [3,45]
        	},
        	descricaoPostagem : {
        		required : true,
        		rangelength : [3,320]
        	}
        }
    });
});