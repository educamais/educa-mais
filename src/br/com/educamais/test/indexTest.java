package br.com.educamais.test;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

public class indexTest {

	private WebDriver driver;

	@Before
	public void inicializar() {
		driver = new FirefoxDriver();
		driver.get("http://localhost:8080/educa-mais/");
	}

	@After
	public void encerrar() {
		driver.quit();
	}

	@Test
	public void LoginContaCadastrada() throws InterruptedException {

		WebElement email = driver.findElement(By.id("inputForm:emailLogin"));
		WebElement senha = driver.findElement(By.id("inputForm:senhaLogin"));

		email.sendKeys("Gabriel@gmail.com");
		senha.sendKeys("12345678");

		Assert.assertEquals("Gabriel@gmail.com", email.getAttribute("value"));
		Assert.assertEquals("12345678", senha.getAttribute("value"));

		driver.findElement(By.id("botaoForm:Entrar")).click();

		driver.wait(10000);

		Assert.assertEquals("http://localhost:8080/educa-mais/telaUsuario", driver.getCurrentUrl());
	}

	@Test
	public void LoginContaNaoCadastrada() throws InterruptedException {

		WebElement email = driver.findElement(By.id("inputForm:emailLogin"));
		WebElement senha = driver.findElement(By.id("inputForm:senhaLogin"));

		email.sendKeys("adriananeves@gmail.com");
		senha.sendKeys("adriananeves");

		Assert.assertEquals("adriananeves@gmail.com", email.getAttribute("value"));
		Assert.assertEquals("adriananeves", senha.getAttribute("value"));

		driver.findElement(By.id("botaoForm:Entrar")).click();

		driver.wait(10000);

		Assert.assertEquals("http://localhost:8080/educa-mais/", driver.getCurrentUrl());
	}

	@Test
	public void validaCampoCadastro() {
		driver.findElement(By.id("cadastroNav")).click();

		WebElement nome = driver.findElement(By.id("nomeCadastro"));
		WebElement email = driver.findElement(By.id("emailCadastro"));
		WebElement senha = driver.findElement(By.id("senhaCadastro"));
		WebElement confirmarSenha = driver.findElement(By.id("confirmarSenhaCadastro"));

		nome.sendKeys("Carlos");
		email.sendKeys("Carlos@gmail.com");
		senha.sendKeys("0987654321");
		confirmarSenha.sendKeys("0987654321");

		Assert.assertEquals("Carlos", nome.getAttribute("value"));
		Assert.assertEquals("Carlos@gmail.com", email.getAttribute("value"));
		Assert.assertEquals("0987654321", senha.getAttribute("value"));
		Assert.assertEquals("0987654321", confirmarSenha.getAttribute("value"));
		Assert.assertEquals(senha.getAttribute("value"), confirmarSenha.getAttribute("value"));
	}

	@Test
	public void cadastroSucesso() throws InterruptedException {

		validaCampoCadastro();

		driver.findElement(By.id("btnCadastrar")).click();

		driver.wait(10000);

		Assert.assertEquals("http://localhost:8080/educa-mais/telaUsuario", driver.getCurrentUrl());
	}

	@Test
	public void cadastroErroEmailCadastrado() throws InterruptedException {
		validaCampoCadastro();

		driver.findElement(By.id("btnCadastrar")).click();

		driver.wait(10000);

		Assert.assertEquals("http://localhost:8080/educa-mais/", driver.getCurrentUrl());
	}

}
