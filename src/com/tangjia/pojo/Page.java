package com.tangjia.pojo;

import javax.naming.SizeLimitExceededException;
import java.util.List;

public class Page<T> {

    public static final Integer SIZE = 4;

    private Integer pageNumber;

    private Integer totalPageNumber;

    private Integer pageSize = SIZE;

    private Integer totalPageSize;

    private List<T> items;


    @Override
    public String toString() {
        return "Page{" +
                "pageNumber=" + pageNumber +
                ", totalPageNumber=" + totalPageNumber +
                ", pageSize=" + pageSize +
                ", totalPageSize=" + totalPageSize +
                ", items=" + items +
                '}';
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getTotalPageNumber() {
        return totalPageNumber;
    }

    public void setTotalPageNumber(Integer totalPageNumber) {
        this.totalPageNumber = totalPageNumber;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPageSize() {
        return totalPageSize;
    }

    public void setTotalPageSize(Integer totalPageSize) {
        this.totalPageSize = totalPageSize;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }
}