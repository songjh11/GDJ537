package com.app.home.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FileManageController {
	@Autowired
	private FileManageService fileManageService;

	@GetMapping("/fileDown/{path}/{fileNum}")
	public ModelAndView fileDown(FileVO fileVO,@PathVariable String path)throws Exception {
		ModelAndView mv = new ModelAndView();

		fileVO = fileManageService.getFileDetail(fileVO);

		log.info("==fileVO {}==", path);

		mv.addObject("fileVO", fileVO);
		mv.addObject("path", path);
		mv.setViewName("fileManager");

		return mv;
	}

	@GetMapping("/fileDelete/{path}/{fileNum}")
	@ResponseBody
	public int fileDel(FileVO fileVO,@PathVariable String path) throws Exception{
		int result = fileManageService.setFileDelete(fileVO, path);

		return result;
	}

}
