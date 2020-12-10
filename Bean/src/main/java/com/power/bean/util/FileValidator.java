package com.power.bean.util;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.power.bean.dto.LoginDto;

@Component
public class FileValidator implements Validator {
// 파일유효성 체크할 클래스

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		// Errors 를 상속받은 BindingResult. 때문에 Controller의 BindingResult에서 결과를 받아 사용할 수 있다.
		
		LoginDto file = null;
		
		file.setMember_mpfile((MultipartFile) target);
		
		// file 사이즈가 0일 경우 에러 발생
		if(file.getMember_mpfile().getSize() == 0) {
			
			errors.rejectValue("mpfile", "fileNEP", "plase select a file");
			// 찾으려는 파일, 코드(propertise로 선언해야 함), 디폴트 메시지

		}

	}

}
