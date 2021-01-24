package dao;

import model.Card;
import model.User;

import java.util.List;

public interface ICardDao {
    public void insertCard(Card card);
    public Card selectCard(int id);
    public List<Card> selectListCard(User user);
    public boolean deleteCard(int id);
    public boolean updateCard(int id);
}
