package org.mnu.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.UUID;

import org.mnu.domain.BoardVO;
import org.mnu.domain.Criteria;
import org.mnu.domain.PageDTO;
import org.mnu.service.AdminServiceImpl; // ★ 추가됨
import org.mnu.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired; // ★ 추가됨
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
    
    // ★ [추가됨] 관리자 서비스 주입 (경고 처리를 위해 필요)
    // AllArgsConstructor 때문에 자동 주입되지만, 명시적으로 필드 선언 필요
    private AdminServiceImpl adminService; 

    // 이미지 저장 경로 (C드라이브에 upload 폴더가 있어야 합니다)
    private static final String UPLOAD_FOLDER = "C:\\upload";

    @GetMapping("/list")
    public void list(Criteria cri, Model model) {
        if (cri.getTypeArr() == null) {
            cri.setTypeArr(new String[]{});
        }
        if (cri.getKeyword() == null) {
            cri.setKeyword("");
        }

        log.info("list: " + cri);
        model.addAttribute("list", service.getList(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal()));
    }

    @GetMapping("/register")
    public void register() {
    }

    @PostMapping("/register")
    public String register(BoardVO board, MultipartFile uploadFile, RedirectAttributes rttr) {
        log.info("register: " + board);

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
        return "redirect:/board/list";
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
        return "redirect:/board/list";
    }

    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {
        log.info("이미지 출력 요청: " + fileName);
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
        log.info("게시글 신고: bno=" + bno + ", user=" + userId);
        boolean result = service.report(bno, userId);

        if (result) {
            rttr.addFlashAttribute("msg", "신고가 정상적으로 접수되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "이미 신고한 게시글입니다.");
        }

        rttr.addAttribute("bno", bno);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        
        return "redirect:/board/get";
    }

    // ★ [추가됨] 관리자 경고 기능 (/board/admin/warn)
    @PostMapping("/admin/warn")
    public String warnUser(Long bno, String userId, RedirectAttributes rttr) {
        log.info("관리자 경고 요청: bno=" + bno + ", targetUser=" + userId);
        
        // 관리자 서비스 호출하여 경고 처리 (1회, 3회, 5회 로직 수행)
        String resultMsg = adminService.giveWarning(userId, bno);
        
        rttr.addFlashAttribute("msg", resultMsg);
        return "redirect:/board/list"; // 처리 후 목록으로 이동
    }
}