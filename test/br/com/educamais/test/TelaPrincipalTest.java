package br.com.educamais.test;

import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import br.com.educamais.pages.TelaPrincipalPage;

public class TelaPrincipalTest {
	
	private WebDriver driver;
	private TelaPrincipalPage page;
	
	@Before
	public void inicializar() {
		driver = new FirefoxDriver();
		driver.get("http://localhost:8080/educa-mais/");
		page = new TelaPrincipalPage(driver);
	}
	
	@After
	public void encerrar() {
		driver.quit();
	}
	
	// LOGIN
	@Test
	public void fazerLoginSucesso() throws InterruptedException {
		page.setEmailLogin("Gabriel@gmail.com");
		page.setSenhaLogin("123456789");
		page.entrar();
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		Assert.assertEquals("Logado com sucesso", driver.findElement(By.tagName("h1")).getText());
		driver.manage().timeouts().implicitlyWait(0, TimeUnit.SECONDS);
	}
	
	@Test
	public void fazerLoginFalha() throws InterruptedException {
		page.setEmailLogin("Leirbag@gmail.com");
		page.setSenhaLogin("0987654321");
		page.entrar();
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		Assert.assertEquals("Usuário ou senha incorreto!", driver.findElement(By.tagName("h1")).getText());
		driver.manage().timeouts().implicitlyWait(0, TimeUnit.SECONDS);
	}
	
	// CADASTRO
	
	@Test
	public void fazerCadastroSucesso() throws InterruptedException {
		page.trocarCadastro();
		page.setNomeCadastro("Adriana Neves");
		page.setEmailCadastro("AdrianaNeves@gmail.com");
		page.setSenhaCadastro("1234567890");
		page.setConfirmarSenhaCadastro("1234567890");
		page.cadastrar();
		
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		Assert.assertEquals("Conta criada com sucesso!", driver.findElement(By.tagName("h1")).getText());
		driver.manage().timeouts().implicitlyWait(0, TimeUnit.SECONDS);
	}
	
	@Test
	public void fazerCadastroFalha() throws InterruptedException {
		page.trocarCadastro();
		page.setNomeCadastro("Adriana Neves");
		page.setEmailCadastro("Adriana@gmail.com");
		page.setSenhaCadastro("1234567890");
		page.setConfirmarSenhaCadastro("1234567890");
		page.cadastrar();
		
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		Assert.assertEquals("E-mail já cadastrado!", driver.findElement(By.tagName("h1")).getText());
		driver.manage().timeouts().implicitlyWait(0, TimeUnit.SECONDS);
	}
	
	/*
	// TESTAR CAMPOS E BOTÃO DO FORMULÁRIO DE LOGIN
	
	@Test
	public void interacaoComEmailLogin() {
		page.setEmailLogin("gabryel@gmail.com");
		Assert.assertEquals("gabryel@gmail.com", page.obterEmailLogin());
	}
	
	@Test
	public void interacaoComSenhaLogin() {
		page.setSenhaLogin("123456789");
		Assert.assertEquals("123456789", page.obterSenhaLogin());
	}
	
	@Test
	public void interagirComBotaoEntrarLogin() {
		page.entrar();
		Assert.assertEquals("O campo acima é requerido.", page.obterMensagemEmailLoginError());
		Assert.assertEquals("O campo acima é requerido.", page.obterMensagemSenhaLoginError());
	}
	
	@Test
	public void validarEmailLogin() {
		page.setEmailLogin("Gabriel");
		Assert.assertEquals("Por favor, forneça um endereço de email válido.", page.obterMensagemEmailLoginError());
	}
	
	@Test
	public void validarTamanhoSenhaLogin() {
		String senha = "0";
		for (int i = 1; i < 8; i++) {
			page.setSenhaLogin(senha);
			page.entrar();
			Assert.assertEquals("Por favor, forneça ao menos 8 caracteres.", page.obterMensagemSenhaLoginError());
		}
	}
	
	
	// TESTAR CAMPOS E BOTÃO DO FORMULÁRIO DE CADASTRO
	
	@Test
	public void interacaoComNomeCadastro() {
		page.trocarCadastro();
		page.setNomeCadastro("Adriana Neves");
		Assert.assertEquals("Adriana Neves", page.obterNomeCadastro());
	}
	
	@Test
	public void interacaoComEmailCadastro() {
		page.trocarCadastro();
		page.setEmailCadastro("Adriana@gmail.com");
		Assert.assertEquals("Adriana@gmail.com", page.obterEmailCadastro());
	}
	
	@Test
	public void interacaoComSenhaCadastro() {
		page.trocarCadastro();
		page.setSenhaCadastro("123456789");
		Assert.assertEquals("123456789", page.obterSenhaCadastro());
	}
	
	@Test
	public void interacaoComConfirmarSenhaCadastro() {
		page.trocarCadastro();
		page.setConfirmarSenhaCadastro("123456789");
		Assert.assertEquals("123456789", page.obterConfirmarSenhaCadastro());
	}
	
	@Test
	public void interacaoComBotaoCadastrar() {
		page.trocarCadastro();
		page.cadastrar();
		Assert.assertEquals("O campo acima é requerido.", page.obterMensagemNomeCadastroError());
		Assert.assertEquals("O campo acima é requerido.", page.obterMensagemEmailCadastroError());
		Assert.assertEquals("O campo acima é requerido.", page.obterMensagemSenhaCadastroError());
		Assert.assertEquals("O campo acima é requerido.", page.obterMensagemConfirmarSenhaCadastroError());
	}
	
	@Test
	public void validarEmailCadastro() {
		page.trocarCadastro();
		page.setEmailCadastro("Gabriel");
		page.cadastrar();
		Assert.assertEquals("Por favor, forneça um endereço de email válido.", page.obterMensagemEmailCadastroError());
	}
	
	
	@Test
	public void validarTamanhoSenhaCadastro() {
		String senha = "0";
		page.trocarCadastro();
		for (int i = 1; i < 8; i++) {
			page.setSenhaCadastro(senha);
			page.cadastrar();
			Assert.assertEquals("Por favor, forneça ao menos 8 caracteres.", page.obterMensagemSenhaCadastroError());
		}
	}
	
	@Test
	public void validarTamanhoConfirmarSenhaCadastro() {
		String senha = "0";
		page.trocarCadastro();
		for (int i = 1; i < 8; i++) {
			page.setConfirmarSenhaCadastro(senha);
			page.cadastrar();
			Assert.assertEquals("Por favor, forneça ao menos 8 caracteres.", page.obterMensagemConfirmarSenhaCadastroError());
		}
	}
	*/
}
