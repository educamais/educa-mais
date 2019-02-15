package br.com.educamais.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.educamais.model.Turma;
import br.com.educamais.model.TurmaDao;

public class TurmaConverter implements Converter<String, Turma> {
	public Turma convert(String id) {
		TurmaDao dao = new TurmaDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}