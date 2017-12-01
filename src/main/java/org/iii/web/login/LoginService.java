package org.iii.web.login;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.iii.web.login.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
//import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service("LoginService")
public class LoginService {
	
	@Inject
	private LoginRepository loginRepository;
	
	public String getUserName(String username) {
		
		try{
			String accountName = loginRepository.selectUser(username);
			return accountName;
			
		}
		catch(Exception e){
			System.out.print(e);
			return "error from LoginService";
		}
		
	}
	
	public String getUserEmail(String username) {
		
		try{
			String email = loginRepository.selectEmail(username);
			return email;
			
		}
		catch(Exception e){
			System.out.print(e);
			return "error from LoginService";
		}
		
	}

	public List getallUserinfo() {

			List alluserinfo = loginRepository.selectallUsers();
			return alluserinfo;
		
	}
	
	public int insertUser(String username, String password, String email, String enabled) {

		int updateCount = loginRepository.insertUser(username, password, email, enabled);
		return updateCount;
	
	}
	
	public void deleteUser(String username) {

		loginRepository.deleteUser(username);
	
	}
	
	public List getallparkinfo() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> allparkinfo = loginRepository.selectallparks();
		return allparkinfo;
	}
	
	public List getallstationinfo() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> allstationinfo = loginRepository.selectallstations();
		return allstationinfo;
	}
	
	public List getallnearstationinfo() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> allnearstationinfo = loginRepository.selectnearstations();
		return allnearstationinfo;
	}
}
