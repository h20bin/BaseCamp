package org.mnu.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.mnu.domain.BoardVO;
import org.mnu.domain.Criteria;
import org.mnu.domain.MemberVO;
import org.mnu.domain.PageDTO;
import org.mnu.service.AdminServiceImpl;
import org.mnu.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

    private BoardService service;
    private AdminServiceImpl adminService; 

    private static final String UPLOAD_FOLDER = "C:\\upload";

    // ★ [수정됨] 목록 조회: 카테고리 처리 추가
    @GetMapping("/list")
    public void list(Criteria cri, Model model) {
        
        // 카테고리가 없으면 기본 'FREE'(자유)로 설정
        if (cri.getCategory() == null || ((HttpHeaders) cri.getCategory()).isEmpty()) {
            cri.setCategory("FREE");
        }

        if (cri.getTypeArr() == null) {
            cri.setTypeArr(new String[]{});
        }
        if (cri.getKeyword() == null) {
            cri.setKeyword("");
        }

        log.info("list: " + cri);
        model.addAttribute("list", service.getList(cri));
        
        // getTotal에도 cri를 넘겨야 카테고리별 개수가 나옴 (Service 수정 필요할 수 있음)
        // 일단 기존 getTotal()이 인자가 없다면 service.getTotal(cri)로 바꿔야 함.
        model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
        
        // 탭 활성화를 위해 현재 카테고리 값 전달
        model.addAttribute("category", cri.getCategory());
    }

    @GetMapping("/register")
    public void register() {
    }

    // ★ [수정됨] 글 등록: 공지사항 권한 체크 및 파일 업로드
    @PostMapping("/register")
    public String register(BoardVO board, MultipartFile uploadFile, 
                           RedirectAttributes rttr, HttpSession session) {
        log.info("register: " + board);

        // 1. 관리자 권한 체크
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        
        if (board.getIsNotice() != null && board.getIsNotice().equals("Y")) {
            if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getAuth())) {
                board.setIsNotice("N"); 
            }
        } else {
            board.setIsNotice("N");
        }
        
        // 2. 카테고리 값 체크 (없으면 FREE)
        if(board.getCategory() == null || ((HttpHeaders) board.getCategory()).isEmpty()) {
            board.setCategory("FREE");
        }

        // 3. 파일 업로드
        if (uploadFile != null && !uploadFile.isEmpty()) {
            String uploadFileName = uploadFile.getOriginalFilename();
            String uuid = UUID.randomUUID().toString();
            uploadFileName = uuid + "_" + uploadFileName;

            try {
                File saveFile = new File(UPLOAD_FOLDER, uploadFileName);
                uploadFile.transferTo(saveFile);
                board.setFileName(uploadFileName);
            } catch (Exception e) {
                log.error("파일 업로드 실패: " + e.getMessage());
            }
        }

        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());
        return "redirect:/board/list"; // 카테고리 유지를 위해선 list?category=... 가 좋지만 일단 기본 리다이렉트
    }

    @GetMapping({ "/get", "/modify" })
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("/get or modify");
        model.addAttribute("board", service.get(bno));
    }

    @PostMapping("/modify")
    public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
        log.info("modify:" + board);
        if (service.modify(board)) {
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("category", cri.getCategory()); // 수정 후 원래 카테고리로 복귀
        return "redirect:/board/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
        log.info("remove..." + bno);
        if (service.remove(bno)) {
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("category", cri.getCategory());
        return "redirect:/board/list";
    }

    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {
        File file = new File(UPLOAD_FOLDER + "\\" + fileName);
        ResponseEntity<byte[]> result = null;
        try {
            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @PostMapping("/report")
    public String report(Long bno, String userId, Criteria cri, RedirectAttributes rttr) {
        boolean result = service.report(bno, userId);
        if (result) rttr.addFlashAttribute("msg", "신고가 접수되었습니다.");
        else rttr.addFlashAttribute("msg", "이미 신고한 게시글입니다.");

        rttr.addAttribute("bno", bno);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        return "redirect:/board/get";
    }

    @PostMapping("/admin/warn")
    public String warnUser(Long bno, String userId, RedirectAttributes rttr) {
        String resultMsg = adminService.giveWarning(userId, bno);
        rttr.addFlashAttribute("msg", resultMsg);
        return "redirect:/board/list";
    }
}