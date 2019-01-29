package br.com.educamais.entidades;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class DSL {

	private WebDriver dsl;
	
	public DSL(WebDriver driver) {
		dsl = driver;
	}
	
	public void escreve(String id, String texto) {
		dsl.findElement(By.id(id)).sendKeys(texto);
	}
	
	public String obterTextoCampo(String id) {
		return dsl.findElement(By.id(id)).getText();
	}
	
	public String obterValorCampo(String id) {
		return dsl.findElement(By.id(id)).getAttribute("value");
	}
	
	public void clicarBotao(String id) {
		dsl.findElement(By.id(id)).click();
	}
	
	public void clicarLink(String link) {
		dsl.findElement(By.linkText(link)).click();
	}
}
