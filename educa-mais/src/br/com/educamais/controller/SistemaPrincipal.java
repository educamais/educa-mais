package br.com.educamais.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SistemaPrincipal {
	
	@RequestMapping("teste")
	public String test() {
		
		return "teste";
	}
}
