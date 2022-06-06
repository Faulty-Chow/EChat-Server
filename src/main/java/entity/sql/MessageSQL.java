package entity.sql;

import entity.Message;
import javafx.util.Pair;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class MessageSQL {
    private Connection SQLConnection;

    public MessageSQL() {
        this.SQLConnection = SQLDriver.SQLConnection;
    }

    public MessageSQL(Connection SQLConnection) {
        this.SQLConnection = SQLConnection;
    }

    public List<Message> getMessageList(String userId1, String userId2) throws SQLException {
        List<Message> messageList = new ArrayList<>();
        String sql = "SELECT *" +
                " FROM " + DatabaseStructure.TABLE_MESSAGE +
                " WHERE " + DatabaseStructure.COLUMN_MESSAGE_FROM + " = ?" +
                " AND " + DatabaseStructure.COLUMN_MESSAGE_TO + " = ?" +
                " OR " + DatabaseStructure.COLUMN_MESSAGE_FROM + " = ?" +
                " AND " + DatabaseStructure.COLUMN_MESSAGE_TO + " = ?";
        PreparedStatement preparedStatement = SQLConnection.prepareStatement(sql);
        preparedStatement.setString(1, userId1);
        preparedStatement.setString(2, userId2);
        preparedStatement.setString(3, userId2);
        preparedStatement.setString(4, userId1);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String fromId1 = resultSet.getString(DatabaseStructure.COLUMN_MESSAGE_FROM);
            String toId1 = resultSet.getString(DatabaseStructure.COLUMN_MESSAGE_TO);
            java.sql.Timestamp time = resultSet.getTimestamp(DatabaseStructure.COLUMN_MESSAGE_TIME);
            String content = resultSet.getString(DatabaseStructure.COLUMN_MESSAGE_CONTENT);
            Message message = new Message(fromId1, toId1, time, content);
            messageList.add(message);
        }
        messageList.sort(Comparator.comparing(Message::getSendTime));
        return messageList;
    }

    public void sendMessage(Message message) throws SQLException {
        String sql = "INSERT INTO " + DatabaseStructure.TABLE_MESSAGE +
                " (" + DatabaseStructure.COLUMN_MESSAGE_FROM + ", " +
                DatabaseStructure.COLUMN_MESSAGE_TO + ", " +
                DatabaseStructure.COLUMN_MESSAGE_TIME + ", " +
                DatabaseStructure.COLUMN_MESSAGE_CONTENT + ") " +
                "VALUES (?, ?, ?, ?)";
        PreparedStatement preparedStatement = SQLConnection.prepareStatement(sql);
        preparedStatement.setString(1, message.getFromUserId());
        preparedStatement.setString(2, message.getToUserId());
        preparedStatement.setDate(3, new java.sql.Date(message.getSendTime().getTime()));
        preparedStatement.setString(4, message.getContent());
        preparedStatement.executeUpdate();
    }

    public List<Message> getMessageListAfter(String fromId, String toId, Date time) throws SQLException {
        List<Message> messageList = new ArrayList<>();
        String sql = "SELECT *" +
                " FROM " + DatabaseStructure.TABLE_MESSAGE +
                " WHERE " + DatabaseStructure.COLUMN_MESSAGE_FROM + " = ?" +
                " AND " + DatabaseStructure.COLUMN_MESSAGE_TO + " = ?" +
                " AND " + DatabaseStructure.COLUMN_MESSAGE_TIME + " > ?";
        PreparedStatement preparedStatement = SQLConnection.prepareStatement(sql);
        preparedStatement.setString(1, fromId);
        preparedStatement.setString(2, toId);
        preparedStatement.setDate(3, new java.sql.Date(time.getTime()));
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String fromId1 = resultSet.getString(DatabaseStructure.COLUMN_MESSAGE_FROM);
            String toId1 = resultSet.getString(DatabaseStructure.COLUMN_MESSAGE_TO);
            java.sql.Timestamp time1 = resultSet.getTimestamp(DatabaseStructure.COLUMN_MESSAGE_TIME);
            String content = resultSet.getString(DatabaseStructure.COLUMN_MESSAGE_CONTENT);
            Message message = new Message(fromId1, toId1, time1, content);
            messageList.add(message);
        }
        messageList.sort(Comparator.comparing(Message::getSendTime));
        return messageList;
    }
}
