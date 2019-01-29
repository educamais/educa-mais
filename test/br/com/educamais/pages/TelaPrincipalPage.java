package br.com.educamais.pages;

import org.openqa.selenium.WebDriver;

import br.com.educamais.entidades.DSL;

public class TelaPrincipalPage {

	private DSL dsl;
	
	public TelaPrincipalPage(WebDriver driver) {
		dsl = new DSL(driver);
	}
	
	// FORMULÁRIO DE LOGIN
	public void trocarLogin() {
		dsl.clicarLink("Login");
	}
	
	
	public void setEmailLogin(String email) {
		dsl.escreve("emailLogin", email);
	}
	
	public void setSenhaLogin(String senha) {
		dsl.escreve("senhaLogin", senha);
	}
	
	
	public String obterEmailLogin() {
		return dsl.obterValorCampo("emailLogin");
	}
	
	public String obterSenhaLogin() {
		return dsl.obterValorCampo("senhaLogin");
	}
	
	
	public void entrar() {
		dsl.clicarBotao("botaoEntrar");
	}
	
	//MENSAGENS DE ERRO LOGIN
	public String obterMensagemEmailLoginError() {
		return dsl.obterTextoCampo("emailLogin-error");
	}
	
	public String obterMensagemSenhaLoginError() {
		return dsl.obterTextoCampo("senhaLogin-error");
	}
	
	// FORMULÁRIO DE CADASTRO
	
	public void trocarCadastro() {
		dsl.clicarLink("Cadastro");
	}
	
	
	public void setNomeCadastro(String nome) {
		dsl.escreve("nomeCadastro", nome);
	}
	
	public void setEmailCadastro(String email) {
		dsl.escreve("emailCadastro", email);
	}
	
	public void setSenhaCadastro(String senha) {
		dsl.escreve("senhaCadastro", senha);
	}
	
	public void setConfirmarSenhaCadastro(String confirmarSenha) {
		dsl.escreve("confirmarSenhaCadastro", confirmarSenha);
	}
	
	
	public String obterNomeCadastro() {
		return dsl.obterValorCampo("nomeCadastro");
	}
	
	public String obterEmailCadastro() {
		return dsl.obterValorCampo("emailCadastro");
	}
	
	public String obterSenhaCadastro() {
		return dsl.obterValorCampo("senhaCadastro");
	}
	
	public String obterConfirmarSenhaCadastro() {
		return dsl.obterValorCampo("confirmarSenhaCadastro");
	}
	
	public void cadastrar() {
		dsl.clicarBotao("botaoCadastrar");
	}
	
	//MENSAGENS DE ERRO LOGIN
	
	public String obterMensagemNomeCadastroError() {
		return dsl.obterTextoCampo("nomeCadastro-error");
	}
	
	public String obterMensagemEmailCadastroError() {
		return dsl.obterTextoCampo("emailCadastro-error");
	}
	
	public String obterMensagemSenhaCadastroError() {
		return dsl.obterTextoCampo("senhaCadastro-error");
	}
	
	public String obterMensagemConfirmarSenhaCadastroError() {
		return dsl.obterTextoCampo("confirmarSenhaCadastro-error");
	}
}
