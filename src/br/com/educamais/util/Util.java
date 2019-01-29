package br.com.educamais.util;

import java.util.Random;

public class Util {

    public static String randomHex() {

        Random random = new Random();

        int val1 = random.nextInt(999999);
        int val2 = random.nextInt(999999);

        String Hex = new String();

        Hex = Integer.toHexString(val1 * val2);

        return Hex;

    }

}