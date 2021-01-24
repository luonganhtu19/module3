package dao;

import model.Card;
import model.User;

import java.math.BigInteger;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CardDao implements ICardDao {

    private String jdbcURL="jdbc:mysql://localhost:3306/game_magiccard?useSSL=false";
    private String jdbcUserName="root";
    private String jdbcPassword="Tuan@1993";

    private static final String INSERT_MY_CARD_BY_ID="INSERT";
    private static final String SELECT_LIST_CARD="select*from cards";
    private static final String SELECT_CARD_ID="select*from cards where id=?";

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
    public void insertCard(Card card) {
    }

    @Override
    public Card selectCard(int id) {
        return null;
        }



    @Override
    public List<Card> selectListCard(User user) {

        List<Card> cards=new ArrayList<>();
        try {
            try(PreparedStatement preparedStatement=preparedStatementConnection(SELECT_LIST_CARD);)
            {
                ResultSet resultSet=preparedStatement.executeQuery();
                while (resultSet.next()){
                    int idCard=Integer.parseInt(resultSet.getString("id"));
                    String nameCard=resultSet.getString("nameCard");
                    int attack=resultSet.getInt("attack");
                    int defenses=resultSet.getInt("defenses");
                    cards.add(new Card(idCard,nameCard,attack,defenses));
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cards;
    }

    @Override
    public boolean deleteCard(int id) {
        return false;
    }

    @Override
    public boolean updateCard(int id) {
        return false;
    }
    private PreparedStatement preparedStatementConnection(String query) throws SQLException {
        Connection connection=getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement(query);
        return preparedStatement;
    }

}
