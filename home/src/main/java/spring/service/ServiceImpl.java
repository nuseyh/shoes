package spring.service;

import java.security.MessageDigest;

import org.springframework.stereotype.Repository;

@Repository("Service")
public class ServiceImpl implements Service{

	@Override
	public String encodingPw(String pw) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hash = md.digest(pw.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}
			return hexString.toString(); 
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	@Override
	public void tmepEmail() {
		
	}
	

}
