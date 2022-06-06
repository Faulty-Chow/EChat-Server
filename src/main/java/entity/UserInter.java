package entity;

import java.sql.SQLException;
import java.util.List;

public interface UserInter {

    User byId(String id)throws SQLException;

    boolean createUser(User user)throws SQLException;

    boolean updateUser(User user)throws SQLException;

    boolean deleteUser(User user)throws SQLException;

    boolean leaveSession(User user,String sessionId)throws SQLException;

    List<User> getAllUsers()throws SQLException;
}
