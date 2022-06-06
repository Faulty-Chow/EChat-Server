package entity;

import entity.sql.UserInterImpl;
import entity.sql.ChatSessionInterImpl;

import java.io.Serializable;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

public class Msg implements Serializable {

    private String fromUserId;
    private String toSessionId;
    private Timestamp sendTime;
    private String content;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Msg)) return false;
        Msg msg = (Msg) o;
        return getFromUserId().equals(msg.getFromUserId()) && getToSessionId().equals(msg.getToSessionId()) && Objects.equals(getSendTime(), msg.getSendTime()) && getContent().equals(msg.getContent());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getFromUserId(), getToSessionId(), getSendTime(), getContent());
    }

    public Msg(String fromUserId, String toSessionId, Timestamp sendTime, String content) {
        this.fromUserId = fromUserId;
        this.toSessionId = toSessionId;
        this.sendTime = sendTime;
        this.content = content;
    }

    public User getFrom() {
        try {
            return new UserInterImpl().byId(fromUserId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public String getFromUserId(){
        return this.fromUserId;
    }

    public ChatSession getTo() {
        try {
            return new ChatSessionInterImpl().byId(toSessionId);
        }catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public String getToSessionId(){
        return this.toSessionId;
    }

    public Timestamp getSendTime() {
        return sendTime;
    }

    public String getContent() {
        return content;
    }
}

