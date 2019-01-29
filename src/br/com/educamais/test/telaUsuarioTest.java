package br.com.educamais.test;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;


public class telaUsuarioTest {
	
	private WebDriver driver; 

	@Before
	public void inicializar() {
		driver = new FirefoxDriver();
		driver.get("http://localhost:8080/educa-mais/telaUsuario");
	}

	@After
	public void encerrar() {
		driver.quit();
	}
	
	@Test
	public void validarCampoCadastroTurma() {
		
		driver.findElement(By.linkText("Criar Turma")).click();
		
		WebElement nome = driver.findElement(By.id("nomeTurmaCadastro"));
		nome.sendKeys("Turma 2ºA - IPI");
		
		Assert.assertEquals("Turma 2ºA - IPI", nome.getAttribute("value"));
	}
	
	@Test
	public void cadastroTurmaSucesso() throws InterruptedException {
		
		validarCampoCadastroTurma();
		
		driver.findElement(By.id("btn_criarTurma")).click();
		
		WebElement mensagem = driver.findElement(By.tagName("h1"));
		
		Assert.assertEquals("Turma criada com sucesso!",mensagem.getText());
		
	}
}
