package edu.autocar.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.autocar.domain.Avata;
import edu.autocar.domain.Member;
import edu.autocar.domain.ResultMsg;
import edu.autocar.service.AvataService;
import edu.autocar.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	@Autowired
	MemberService service;

	@Autowired
	AvataService avataService;

	@GetMapping("/join")
	public String getJoin(Member member) throws Exception {
		return "member/join";
	}

	@PostMapping("/join")
	public String postJoin(@Valid Member member, BindingResult result, @RequestParam("avata") MultipartFile file,
			RedirectAttributes ra) throws Exception {
		if (result.hasErrors()) {
			return "member/join";
		}
		service.create(member, file);
		ra.addFlashAttribute("member", member);
		return "redirect:/join_success";
	}

	@GetMapping("/join_success")
	public String joinSuccess() {
		return "member/join_success";
	}

	@GetMapping("/member/view")
	public void view(Model model, HttpSession session) throws Exception {
		Member user = (Member) session.getAttribute("USER");
		Member member = service.getMember(user.getUserId());
		model.addAttribute("member", member);
	}

	@GetMapping("/member/edit")
	public void getEdit(Model model, HttpSession session) throws Exception {
		view(model, session);
	}

	@PostMapping("/member/edit")
	public String postEdit(@Valid Member member, BindingResult result, @RequestParam("avata") MultipartFile file,
			HttpSession session) throws Exception {
		if (result.hasErrors())
			return "member/edit";
		if (service.update(member, file)) {
			member = service.getMember(member.getUserId());
			session.setAttribute("USER", member);
			return "redirect:/member/view";
		} else {
			FieldError fieldError = new FieldError("member", "password", "비밀번호가 일치하지 않습니다");
			result.addError(fieldError);
			return "member/edit";
		}
	}

	@GetMapping("/id-check/{userId}")
	@ResponseBody
	public ResponseEntity<ResultMsg> checkId(@PathVariable String userId) throws Exception {
		if (service.getMember(userId) == null) {
			return ResultMsg.response("ok", "사용가능한 ID 입니다.");
		} else {
			return ResultMsg.response("duplicate", "이미 사용중인 ID 입니다.");
		}
	}

	@GetMapping("/member/avata/{userId}")
	@ResponseBody
	public ResponseEntity<byte[]> getAvata(@PathVariable String userId) throws Exception {
		byte[] images = null;
		HttpStatus status = HttpStatus.OK;

		try {
			Avata avata = avataService.getAvata(userId);
			images = avata.getImage();
		} catch (Exception e) {
			status = HttpStatus.NOT_FOUND;
		}
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(images, headers, status);
	}
}
