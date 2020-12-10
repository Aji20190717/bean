package com.power.bean.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.power.bean.biz.QuestionBiz;
import com.power.bean.dto.QuestionDto;
import com.power.bean.util.FileValidator;

@Controller
public class QuestionController {

	@Autowired
	private QuestionBiz questionBiz;

	@Autowired
	private FileValidator fileValidator;

	@RequestMapping("/questionList.do")
	public String questionList(Model model) {

		System.out.println("questionList.do");

		List<QuestionDto> questionlist = questionBiz.selectQuestionList();
		model.addAttribute("questionlist", questionlist);

		System.out.println(questionlist);

		return "question_list";

	}

	@RequestMapping("/questionDetail.do")
	public String questionDetail(Model model, int questionboard_no) {
		
		QuestionDto questionDto = questionBiz.selectOneQuestion(questionboard_no);
		
		model.addAttribute("questinoDto", questionDto);

		return "question_detail";

	}

	@RequestMapping("/questionReply.do")
	public String questionReply(Model model, int questionNum) {

		return "question_reply";
	}

	@RequestMapping("/questionUpdateres.do")
	public String questionUpdateRes() {

		return "question_update";
	}

	@RequestMapping("/questionUpload.do")
	public String questionUpload(Model model) {

		return "question_upload";
	}

	@RequestMapping("/questionUploadres.do")
	public String questionUploadRes(HttpServletRequest request, Model model, QuestionDto dto, BindingResult result) {

		QuestionDto uploadDto = new QuestionDto();
		
		uploadDto.setMember_no(dto.getMember_no());
		uploadDto.setQuestionboard_name(dto.getQuestionboard_name());
		uploadDto.setQuestionboard_groupno(dto.getQuestionboard_groupno());
		uploadDto.setQuestionboard_title(dto.getQuestionboard_title());
		uploadDto.setQuestionboard_content(dto.getQuestionboard_content());
		uploadDto.setQuestionboard_reply("");
		
		
		String name;
		String path;
		String ocr;
		
		//file upload 
		fileValidator.validate(dto, result);

		if (result.hasErrors()) {
			System.out.println("Error!");
		}
		
		if (dto.getQuestion_mpfile().getSize() != 0) {
			
			String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
					
			
			MultipartFile file = dto.getQuestion_mpfile();
			name = file.getOriginalFilename();
			name = name + "Question" + dto.getMember_no() + timeStamp;
			

			//QuestionDto fileObj = new QuestionDto();
			//fileObj.setQuestionboard_imgname(name);

			InputStream inputStream = null;
			OutputStream outputStream = null;

			try {
				
				inputStream = file.getInputStream();
				path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage/questionImgFile/");

				System.out.println("업로드 될 실제 경로(real path) : " + path);

				File storage = new File(path);
				if (!storage.exists()) {
					storage.mkdir();
				}

				File newFile = new File(path + name);
				if (!newFile.exists()) {
					newFile.createNewFile();
				}
				
				uploadDto.setQuestionboard_imgname(name);
				uploadDto.setQuestionboard_imgpath(path);

				outputStream = new FileOutputStream(newFile);

				int read = 0;
				byte[] b = new byte[(int) file.getSize()];

				while ((read = inputStream.read(b)) != -1) {

					outputStream.write(b, 0, read);
				}

			} catch (IOException e) {
				e.printStackTrace();
			} finally {

				try {
					inputStream.close();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
			
			
			//OCR(Connect flask)
			
			//flask 응답 값
			ocr = "";
			
			uploadDto.setQuestionboard_ocr(ocr);
			
		}else {
			
			path = "";
			name = "";
			ocr = "";
			
			uploadDto.setQuestionboard_imgname(name);
			uploadDto.setQuestionboard_imgpath(path);
			uploadDto.setQuestionboard_ocr(ocr);
			
		}
		
		System.out.println(uploadDto.toString());
		int res = questionBiz.uploadQuestion(uploadDto);
		
		if(res > 0) {
			
		return "redirect:questionList.do";
		
		}
		
		return "redirect:questionUpload.do";

	}

	

	@RequestMapping("/questionDelete.do")
	public String questionDelete(int questionboard_no) {
		
		int res = questionBiz.QuestionDelete(questionboard_no);
		
		if(res > 0) {
			
			return "redirect:questionList.do";
			
		}

		return "redirect:questionDetail.do?" + questionboard_no;
	}

}
