package model;

public class Card {
    private int id;
    private int attack;
    private int defenses;
    private String nameCard;


    public String getNameCard() {
        return nameCard;
    }

    public void setNameCard(String nameCard) {
        this.nameCard = nameCard;
    }

    public Card(int id,String nameCard ,int attack, int defenses) {
        this.id = id;
        this.attack = attack;
        this.defenses = defenses;
        this.nameCard=nameCard;
    }

    public Card(String nameCard,int attack, int defenses) {
        this.nameCard=nameCard;
        this.attack = attack;
        this.defenses = defenses;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAttack() {
        return attack;
    }

    public void setAttack(int attack) {
        this.attack = attack;
    }

    public int getDefenses() {
        return defenses;
    }

    public void setDefenses(int defenses) {
        this.defenses = defenses;
    }

}
