package br.com.educamais.util;

import java.util.Random;

public class Util {

    public static String randomHex() {

        Random random = new Random();

        int val = random.nextInt();

        String Hex = new String();

        Hex = Integer.toHexString(val);

        return Hex;

    }

}