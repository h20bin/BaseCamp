package org.mnu.controller;

import java.util.List;

import org.mnu.domain.ReplyVO;
import org.mnu.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/replies/")
@RestController
@Log4j2
@AllArgsConstructor
public class ReplyController {

    private ReplyService service;

    // 1. 댓글 등록 (POST 방식: /replies/new)
    @PostMapping(value = "/new", 
            consumes = "application/json", 
            produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
        log.info("ReplyVO: " + vo);
        
        int insertCount = service.register(vo);
        
        return insertCount == 1 
            ? new ResponseEntity<>("success", HttpStatus.OK) 
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 2. 특정 게시글의 댓글 목록 확인 (GET 방식: /replies/pages/{bno})
    @GetMapping(value = "/pages/{bno}", 
            produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<List<ReplyVO>> getList(@PathVariable("bno") Long bno) {
        log.info("getList..........." + bno);
        
        return new ResponseEntity<>(service.getList(bno), HttpStatus.OK);
    }

    // 3. 댓글 조회 (GET 방식: /replies/{rno})
    @GetMapping(value = "/{rno}", 
            produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {
        log.info("get: " + rno);
        return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
    }

    // 4. 댓글 삭제 (DELETE 방식: /replies/{rno})
    @DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
        log.info("remove: " + rno);
        
        return service.remove(rno) == 1 
            ? new ResponseEntity<>("success", HttpStatus.OK) 
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 5. 댓글 수정 (PUT 또는 PATCH 방식: /replies/{rno})
    @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, 
            value = "/{rno}", 
            consumes = "application/json", 
            produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {
        
        vo.setRno(rno); // URL에 있는 번호를 VO에 세팅
        log.info("rno: " + rno);
        log.info("modify: " + vo);

        return service.modify(vo) == 1 
            ? new ResponseEntity<>("success", HttpStatus.OK) 
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}