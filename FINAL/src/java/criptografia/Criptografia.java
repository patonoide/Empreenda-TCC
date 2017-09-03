/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criptografia;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Asus
 */
public class Criptografia {
    public String cripto(String senha) throws NoSuchAlgorithmException{
         
        
         MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(senha.getBytes());

        byte byteData[] = md.digest();
        StringBuffer hexString = new StringBuffer();
    	for (int i=0;i<byteData.length;i++) {
    		String hex=Integer.toHexString(0xff & byteData[i]);
   	     	if(hex.length()==1) hexString.append('0');
   	     	hexString.append(hex);
    	}
        return hexString.toString();
    }
    }

