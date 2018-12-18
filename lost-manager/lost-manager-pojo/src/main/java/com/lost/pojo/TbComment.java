package com.lost.pojo;

import java.io.Serializable;
import java.util.Date;

public class TbComment  implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 2625318638256237729L;

	private Long id;

    private Date commentTime;

    private Date created;

    private Date updated;

    private String commentText;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText == null ? null : commentText.trim();
    }
}