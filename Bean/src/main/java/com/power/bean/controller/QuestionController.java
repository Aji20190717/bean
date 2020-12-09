package com.power.bean.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import com.power.bean.util.UploadFile;

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
	public String questionDetail(Model model, int questionNum) {

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

		//file upload 
		fileValidator.validate(dto, result);

		if (result.hasErrors()) {
			System.out.println("wow");
		}
		
		System.out.println(dto.getQuestion_mpfile().getSize());
		
		if (dto.getQuestion_mpfile().getSize() != 0) {
			
			System.out.println("형이 왜 여기에?");
			MultipartFile file = dto.getQuestion_mpfile();
			System.out.println(file);
			String name = file.getOriginalFilename();

			QuestionDto fileObj = new QuestionDto();
			fileObj.setQuestionboard_imgname(name);

			InputStream inputStream = null;
			OutputStream outputStream = null;

			try {
				inputStream = file.getInputStream();
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");

				System.out.println("업로드 될 실제 경로(real path) : " + path);

				File storage = new File(path);
				if (!storage.exists()) {
					storage.mkdir();
				}

				File newFile = new File(path + "/" + name);
				if (!newFile.exists()) {
					newFile.createNewFile();
				}

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
		}
		
	
		
		

		return "redirect:questionList.do";
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
