package dao;

import model.User;
import sun.security.provider.MD5;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements IUserDao {
    private String jdbcURL="jdbc:mysql://localhost:3306/game_magiccard?useSSL=false";
    private String jdbcUserName="root";
    private String jdbcPassword="Tuan@1993";
    private static final String INSERT_USERS_BY_ID="INSERT INTO users"+"(namePlayer," +
                                                      " disPlayer,_account,_password,avatar) Values"+
                                                      "(?,?,?,?,?)";
    private static final String SELECT_USER_BY_NAME_ACCOUNT= "SELECT namePlayer," +
                                                                " disPlayName,_account,_password,avatar,typeAccount,pointGame,active_account from users" +
                                                                " where _account=binary ? and _password=binary ? and active_account!='block'";
    private static final String     SELECT_ALL_USERS="SELECT*FROM USERS ";
    protected Connection getConnection(){
        Connection connection=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(jdbcURL,jdbcUserName,jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertUser(User user) throws SQLException {

    }

    @Override
    public User selectUser(int id) {
        return null;
    }

    public User checkLogin(String nameAccount,String password){

        User user=null;
        try(Connection connection=getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(SELECT_USER_BY_NAME_ACCOUNT)) {
            preparedStatement.setString(1,nameAccount);
            preparedStatement.setString(2,getMD5(password));
            System.out.println(preparedStatement);

            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String namePlayer=resultSet.getString("namePlayer");
                String displayName=resultSet.getString("disPlayName");
                String _nameAccount=resultSet.getString("_account");
                String avatar=resultSet.getString("avatar");
                String typeAccount=resultSet.getString("typeAccount");
                String passAccount=resultSet.getString("_password");
                int pointGame=Integer.parseInt(resultSet.getString("pointGame"));
                String active_account=resultSet.getString("active_account");
                user=new User(namePlayer,_nameAccount,passAccount,avatar,typeAccount,displayName,pointGame,active_account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectListUser(User user) {
        List<User> users=new ArrayList<>();
        try(PreparedStatement preparedStatement=preparedStatementConnection(SELECT_ALL_USERS)){
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=Integer.parseInt(resultSet.getString("id"));
                String namePlayer=resultSet.getString("namePlayer");
                String displayName=resultSet.getString("disPlayName");
                if (user.getDisplayName().equals(displayName)) continue;
                if (!user.getDisplayName().equals("founder") && id==1) continue;
                String _nameAccount=resultSet.getString("_account");
                String avatar=resultSet.getString("avatar");
                String typeAccount=resultSet.getString("typeAccount");
                String passAccount=resultSet.getString("_password");
                int pointGame=Integer.parseInt(resultSet.getString("pointGame"));
                String active_account=resultSet.getString("active_account");
                users.add(new User(id,namePlayer,_nameAccount,passAccount,avatar,typeAccount,displayName,pointGame,active_account));
                }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }

    private String getMD5(String input){
        try {
            MessageDigest md= MessageDigest.getInstance("MD5");
            byte[] messageDigest= md.digest(input.getBytes());
            BigInteger no= new BigInteger(1,messageDigest);
            String hashtext=no.toString(16);
            while (hashtext.length()<32){
                hashtext="0"+hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    private PreparedStatement preparedStatementConnection(String query) throws SQLException {
        Connection connection=getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement(query);
            return preparedStatement;
    }

}
