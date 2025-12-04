package org.mnu.domain;

import lombok.Data;

@Data
public class Criteria {

    private int page;
    private int perPageNum;

    private String keyword;      
    private String[] typeArr;    
    
    // ★ [핵심] 카테고리 변수 추가
    private String category; 

    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setPageNum(int pageNum) {
        this.setPage(pageNum);  
    }

    public int getPage() {
        return page;
    }

    public int getPageNum() {
        return this.page;
    }

    public void setPerPageNum(int perPageNum) {
        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }
        this.perPageNum = perPageNum;
    }

    public int getPerPageNum() {
        return perPageNum;
    }

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String[] getTypeArr() {
        return typeArr;
    }

    public void setTypeArr(String[] typeArr) {
        this.typeArr = typeArr;
    }

    // ★ [수정됨] 카테고리 Getter/Setter 정상 구현
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}