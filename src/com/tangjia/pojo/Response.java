package com.tangjia.pojo;

import java.util.Date;

public class Response {
    private Integer id;
    private Integer articleId;
    private String content;
    private Date date;

    public Response() {
    }

    public Response(Integer id, Integer articleId, String content, Date date) {
        this.id = id;
        this.articleId = articleId;
        this.content = content;
        this.date = date;
    }

    @Override
    public String toString() {
        return "Response{" +
                "id=" + id +
                ", articleId=" + articleId +
                ", content='" + content + '\'' +
                ", date=" + date +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
