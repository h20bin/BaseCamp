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

    // 1. 목록 조회
    @GetMapping("/list")
    public void list(Criteria cri, Model model) {
        
        // ★ [수정됨] 잘못된 캐스팅((HttpHeaders)) 제거 및 null 체크 수정
        if (cri.getCategory() == null || cri.getCategory().isEmpty()) {
            cri.setCategory("FREE");
        }

        if (cri.getTypeArr() == null) {
            cri.setTypeArr(new String[]{});
        }
        if (cri.getKeyword() == null) {
            cri.setKeyword("");
        }

        log.info("list: " + cri);
        
        // 목록 데이터 가져오기
        model.addAttribute("list", service.getList(cri));
        
        // 페이징 정보 (전체 개수 구할 때 cri 넘겨야 카테고리별 개수 나옴)
        model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
        
        // 탭 활성화를 위해 현재 카테고리 값 전달
        model.addAttribute("category", cri.getCategory());
    }

    // 2. 글쓰기 페이지 이동
    @GetMapping("/register")
    public void register() {
    }

    // 3. 글 등록 처리
    @PostMapping("/register")
    public String register(BoardVO board, MultipartFile uploadFile, 
                           RedirectAttributes rttr, HttpSession session) {
        log.info("register: " + board);

        // 관리자 권한 체크 (공지사항)
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (board.getIsNotice() != null && board.getIsNotice().equals("Y")) {
            if (loginUser == null || !"ROLE_ADMIN".equals(loginUser.getAuth())) {
                board.setIsNotice("N"); 
            }
        } else {
            board.setIsNotice("N");
        }
        
        // ★ [수정됨] 잘못된 캐스팅 제거
        if(board.getCategory() == null || ((HttpHeaders) board.getCategory()).isEmpty()) {
            board.setCategory("FREE");
        }

        // 파일 업로드 처리
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
        
        // 작성한 카테고리 목록으로 이동
        return "redirect:/board/list?category=" + board.getCategory(); 
    }

    // 4. 상세 보기 및 수정 페이지 이동
    @GetMapping({ "/get", "/modify" })
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("/get or modify");
        model.addAttribute("board", service.get(bno));
    }

    // 5. 수정 처리
    @PostMapping("/modify")
    public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
        log.info("modify:" + board);
        if (service.modify(board)) {
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("category", cri.getCategory());
        return "redirect:/board/list";
    }

    // 6. 삭제 처리
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

    // 7. 이미지 출력
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

    // 8. 신고 처리
    @PostMapping("/report")
    public String report(Long bno, String userId, Criteria cri, RedirectAttributes rttr) {
        boolean result = service.report(bno, userId);
        if (result) rttr.addFlashAttribute("msg", "신고가 접수되었습니다.");
        else rttr.addFlashAttribute("msg", "이미 신고한 게시글입니다.");

        rttr.addAttribute("bno", bno);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("category", cri.getCategory());
        return "redirect:/board/get";
    }

    // 9. 관리자 경고 기능
    @PostMapping("/admin/warn")
    public String warnUser(Long bno, String userId, RedirectAttributes rttr) {
        String resultMsg = adminService.giveWarning(userId, bno);
        rttr.addFlashAttribute("msg", resultMsg);
        return "redirect:/board/list";
    }
}