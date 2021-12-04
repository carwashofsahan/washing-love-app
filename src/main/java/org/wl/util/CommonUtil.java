package org.wl.util;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.security.spec.KeySpec;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;

import org.apache.commons.codec.binary.Base64;

public class CommonUtil {
    private static final String UNICODE_FORMAT = "UTF8";
    private static final String DESEDE_ENCRYPTION_SCHEME = "DESede";
    private static final String myEncryptionKey = "ThisIsSpartaThisIsSparta";

    public static Date convertDateFormat(String userInput) {
        Date date = null;
        String expectedPattern = "yyyy-MM-dd";
        SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
        try {
            // (2) give the formatter a String that matches the SimpleDateFormat pattern
            // String userInput = "09/22/2009";
            date = formatter.parse(userInput);
            // System.out.println(userInput+"="+date);
        } catch (Exception ex) {
            //ex.printStackTrace();
            //date=formatter.parse(convertSimpleDateFormat(new Date()));
        }
        return date;
    }

    public static Date incrementHours(Date date, int hours) {
        return new Date(date.getTime() + TimeUnit.HOURS.toMillis(hours));
    }

    public static String convertSimpleDate(Date date) {
        Format format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }

    public static int getOtp() {
        int min = 1000;
        int max = 9999;
        return (int) Math.floor(Math.random() * (max - min + 1) + min);
    }

    public static String encrypt(String unencryptedString) {
        String encryptedString = null;
        try {
            byte[] arrayBytes = myEncryptionKey.getBytes(UNICODE_FORMAT);
            final KeySpec ks = new DESedeKeySpec(arrayBytes);
            final SecretKeyFactory skf = SecretKeyFactory.getInstance(DESEDE_ENCRYPTION_SCHEME);
            final Cipher cipher = Cipher.getInstance(DESEDE_ENCRYPTION_SCHEME);
            SecretKey key = skf.generateSecret(ks);
            cipher.init(Cipher.ENCRYPT_MODE, key);
            final byte[] plainText = unencryptedString.getBytes(UNICODE_FORMAT);
            final byte[] encryptedText = cipher.doFinal(plainText);
            encryptedString = new String(Base64.encodeBase64(encryptedText));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return encryptedString;
    }

    public static String decrypt(String encryptedString) {
        String decryptedText=null;
        try {
            byte[] arrayBytes = myEncryptionKey.getBytes(UNICODE_FORMAT);
            final KeySpec ks = new DESedeKeySpec(arrayBytes);
            final SecretKeyFactory skf = SecretKeyFactory.getInstance(DESEDE_ENCRYPTION_SCHEME);
            SecretKey key = skf.generateSecret(ks);
            final Cipher cipher = Cipher.getInstance(DESEDE_ENCRYPTION_SCHEME);
            cipher.init(Cipher.DECRYPT_MODE, key);
            byte[] encryptedText = Base64.decodeBase64(encryptedString);
            byte[] plainText = cipher.doFinal(encryptedText);
            decryptedText= new String(plainText);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return decryptedText;
    }
}
