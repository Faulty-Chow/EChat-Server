package entity;

import java.io.Serializable;

import java.sql.Timestamp;
import java.util.Objects;

public class Message implements Serializable {

    private final String fromUserId;
    private final String toUserId;
    private final Timestamp sendTime;
    private final String content;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Message)) return false;
        Message message = (Message) o;
        return getFromUserId().equals(message.getFromUserId()) && getToUserId().equals(message.getToUserId()) && Objects.equals(getSendTime(), message.getSendTime()) && getContent().equals(message.getContent());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getFromUserId(), getToUserId(), getSendTime(), getContent());
    }

    public Message(String fromUserId, String toSessionId, Timestamp sendTime, String content) {
        this.fromUserId = fromUserId;
        this.toUserId = toSessionId;
        this.sendTime = sendTime;
        this.content = content;
    }

    public String getFromUserId(){
        return this.fromUserId;
    }

    public String getToUserId(){
        return this.toUserId;
    }

    public Timestamp getSendTime(){
        return this.sendTime;
    }

    public String getContent(){
        return this.content;
    }
}
