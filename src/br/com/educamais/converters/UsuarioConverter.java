package br.com.educamais.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.educamais.model.Usuario;
import br.com.educamais.model.UsuarioDao;

public class UsuarioConverter implements Converter<String, Usuario> {
	public Usuario convert(String id) {
		UsuarioDao dao = new UsuarioDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}
}
