package br.com.educamais.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;

import br.com.educamais.model.Exclude;

public class Util {

	public static String obterMomentoAtual() {
		Calendar c = Calendar.getInstance();
		int ano = c.get(Calendar.YEAR);
		int mes = c.get(Calendar.MONTH);
		int dia = c.get(Calendar.DAY_OF_MONTH);
		int hora = c.get(Calendar.HOUR_OF_DAY);
		int minuto = c.get(Calendar.MINUTE);
		int segundo = c.get(Calendar.SECOND);
		String momentoUpload = ano + "-" + (mes + 1) + "-" + dia + "-" + hora + "-" + minuto + "-" + segundo;

		return momentoUpload;
	}

	public static boolean fazerUploadImagem(MultipartFile imagem) {
		boolean sucessoUpload = false;
		if (!imagem.isEmpty()) {
			String nomeArquivo = imagem.getOriginalFilename();
			try {
				// Criando o diretório para armazenar o arquivo
				String workspaceProjeto = System.getProperty("user.dir") + "/eclipse-workspace/educa-mais/";
				File dir = new File(workspaceProjeto + "WebContent/resources/img/upload/");
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// Criando o arquivo no diretório
				File serverFile = new File(dir.getAbsolutePath() + File.separator + obterMomentoAtual() + " - " + nomeArquivo);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(imagem.getBytes());
				stream.close();
				System.out.println("Arquivo armazenado em:" + serverFile.getAbsolutePath());
				System.out.println("Você fez o upload do arquivo " + nomeArquivo + " com sucesso");
				sucessoUpload = true;
			} catch (Exception e) {
				System.out.println("Você falhou em carregar o arquivo " + nomeArquivo + " => " + e.getMessage());
			}
		} else {
			System.out.println("Você falhou em carregar o arquivo porque ele está vazio ");
		}
		return sucessoUpload;
	}

	public static String randomHex() {

		Random random = new Random();

		int val1 = random.nextInt(999999);
		int val2 = random.nextInt(999999);

		String Hex = new String();

		Hex = Integer.toHexString(val1 * val2);

		return Hex;

	}
	
	public static void main(String[] args) {
		System.out.println(System.getProperty("user.dir"));
	}
	
	public static ExclusionStrategy getStrategy() {
		return new ExclusionStrategy() {
		    @Override
		    public boolean shouldSkipClass(Class<?> clazz) {
		        return false;
		    }
		 
		    @Override
		    public boolean shouldSkipField(FieldAttributes field) {
		        return field.getAnnotation(Exclude.class) != null;
		    }
		};
	}
}