package edu.autocar.cleancity.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class SHA256Util {
	public static String generateSalt() {
		byte[] salt = new byte[8];
		
		//랜덤 8바이트 데이터 생성
		Random random = new Random();
		random.nextBytes(salt);
		
		// 바이트를 문자열로 변환
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<salt.length;i++) {
			sb.append(String.format("%02x", salt[i]));
		}
		return sb.toString();
	}
	
	public static String getEncrypt(String source, String salt) {
		return getEncrypt(source, salt.getBytes());
	}
	
	public static String getEncrypt(String source, byte[] salt) {
		String result = "";
		
		byte[] a = source.getBytes();
		byte[] bytes = new byte[a.length + salt.length];
		
		System.arraycopy(a, 0, bytes, 0, a.length);
		System.arraycopy(salt, 0, bytes, 0, salt.length);
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			
			byte[] byteData = md.digest();
			// 바이트를 문자열로 변환
			StringBuilder sb = new StringBuilder();
			for(int i=0;i<byteData.length;i++) {
				sb.append(String.format("%02x", byteData[i]));
			}
			
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
}
