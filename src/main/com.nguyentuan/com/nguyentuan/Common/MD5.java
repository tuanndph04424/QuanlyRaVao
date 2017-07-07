package com.nguyentuan.Common;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;

import org.springframework.security.crypto.codec.Base64;

public class MD5 {

	public static String getMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");

			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);

			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}

			return hashtext;
		} catch (Exception e) {
			System.out.println("File name cannot encrypt: " + input);

			e.printStackTrace();
		}
		return "";
	}

}
