package com.power.bean.util;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.power.bean.dto.QuestionDto;


@Service
public class QuestionFileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		QuestionDto dto = (QuestionDto) target;
		
		if(dto.getQuestion_mpfile().getSize() == 0) {
			System.out.println("no file");
		}
	}

}