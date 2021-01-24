package model;

public class User {
    private int idUser;
    private String namePlayer;
    private String nameAccount;
    private String passAccount;
    private String avatar;
    private String typeAccount;
    private String displayName;
    private int pointGame;
    private String active_account;


    User(){};

    public User(int idUser, String namePlayer, String nameAccount, String passAccount, String avatar, String typeAccount, String displayName, int pointGame, String active_account) {
        this.idUser = idUser;
        this.namePlayer = namePlayer;
        this.nameAccount = nameAccount;
        this.passAccount = passAccount;
        this.avatar = avatar;
        this.typeAccount = typeAccount;
        this.displayName = displayName;
        this.pointGame = pointGame;
        this.active_account = active_account;
    }

    public User(String namePlayer, String nameAccount, String passAccount, String avatar, String typeAccount,
                String displayName , int pointGame, String active_account) {
        this.namePlayer = namePlayer;
        this.nameAccount = nameAccount;
        this.passAccount = passAccount;
        this.avatar = avatar;
        this.typeAccount = typeAccount;
        this.displayName = displayName;
        this.pointGame=pointGame;
        this.active_account=active_account;
    }

    public String getActive_account() {
        return active_account;
    }

    public void setActive_account(String active_account) {
        this.active_account = active_account;
    }

    public int getIdUser() {
        return idUser;
    }

    public String getNameAccount() {
        return nameAccount;
    }

    public void setNameAccount(String nameAccount) {
        this.nameAccount = nameAccount;
    }

    public String getPassAccount() {
        return passAccount;
    }

    public void setPassAccount(String passAccount) {
        this.passAccount = passAccount;
    }

    public String getNamePlayer() {
        return namePlayer;
    }

    public void setNamePlayer(String namePlayer) {
        this.namePlayer = namePlayer;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getTypeAccount() {
        return typeAccount;
    }

    public void setTypeAccount(String typeAccount) {
        this.typeAccount = typeAccount;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
    public int getPointGame() {
        return pointGame;
    }

    public void setPointGame(int pointGame) {
        this.pointGame = pointGame;
    }
}
