package com.tangjia.pojo;

import java.util.Date;

public class Article {
    private Integer id;
    private Integer authorId;
    private String content;
    private String title;
    private Integer tags;
    private Date date;
    private Integer extra;

    public Article() {
    }

    public Article(Integer id, Integer authorId, String content, String title, Integer tags, Date date, Integer extra) {
        this.id = id;
        this.authorId = authorId;
        this.content = content;
        this.title = title;
        if (tags!=null){
            this.tags = tags;
        }else {
            this.tags=0;
        }

        this.date = date;
        this.extra = extra;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getTags() {
        return tags;
    }

    public void setTags(Integer tags) {
        this.tags = tags;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getExtra() {
        return extra;
    }

    public void setExtra(Integer extra) {
        this.extra = extra;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", authorId=" + authorId +
                ", content='" + content + '\'' +
                ", title='" + title + '\'' +
                ", tags=" + tags +
                ", date=" + date +
                ", extra=" + extra +
                '}';
    }
}
