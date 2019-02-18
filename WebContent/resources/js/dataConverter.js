function converterData(data) {

	var novaData = data.split(" ");
	var dia = novaData[1].split(",")[0];
	var ano = novaData[2];

	switch (novaData[0]) {
	case "Jan":
		var mes = "01";
		break;
	case "Feb":
		var mes = "02";
		break;
	case "Mar":
		var mes = "03";
		break;
	case "Apr":
		var mes = "04";
		break;
	case "May":
		var mes = "05";
		break;
	case "Jun":
		var mes = "06";
		break;
	case "Jul":
		var mes = "07";
		break;
	case "Aug":
		var mes = "08";
		break;
	case "Sep":
		var mes = "09";
		break;
	case "Oct":
		var mes = "10";
		break;
	case "Nov":
		var mes = "11";
		break;
	case "Dec":
		var mes = "12";
		break;
	}

	return dia + "/" + mes + "/" + ano;
}