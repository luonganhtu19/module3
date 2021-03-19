let arrName = ["SKILLED DRAK MAGICIAN", "JACK'S KNIGHT", "SKILLED WHITE MAGICIAN", "DARK MAGICIAN GIRL", "CHAOS SORCERER", "VICTORY DRAGON", " RED-EYES DARKNESS DRAGON", "RED-EYES B.DRAGON", "GLADIATOR BEAST ALEXANDER", "SUMMONED SKULL", "JUNK DESTROYER", "LIGHT AND DRAKNESS DRAGON", "TYLER THE GREAT WARRIOR", "BID SHIELD GUARDBA", "GRZELLE THE KING OF MYTHICAL BEASTS", "RIGHT LEG OF THE FORBIDDEN ONE", "LEFT LEG OF THE FORBIDDEN ONE", "LEFT ARM OF THE FORBIDDEN ONE", "RIGHT ARM OF THE FORBIDDEN ONE", "EXODIA THE FORBIDDEN ONE", "PITCH-DRAK DRAGON", "TIME WIZARD", "RED-EYES BABY DRAGON", "FERAL IMP", "VALKYRION THE MAGNA WARRIOR", "OBNOXIOUS CELTIC GUARD", "WINGED DRAGON, GUARDIAN OF THE FORTRESS", "CELTIC GURDIAN", "ROCKET WARRIOR", "Y-DRAGON HEAD", "GAMMA THE MAGNET WARRIOR", "AXE RAIDER", "BETA, MAGNETKRIEGER", "DARK BLADE"];
let arrAttack = [1900, 1900, 1700, 2000, 2300, 2400, 2400, 2400, 2400, 2500, 2600, 2800, 3000, 100, 1500, 200, 200, 200, 200, 1000, 900, 500, 1200, 1300, 3500, 1400, 1400, 1400, 1500, 1500, 1500, 1700, 1700, 1800]
let arrDefense = [1700, 1700, 1900, 1700, 2000, 3000, 2000, 2000, 600, 1200, 2500, 2400, 1500, 2600, 1200, 300, 300, 300, 300, 1000, 600, 400, 700, 400, 3850, 1200, 1200, 1200, 1300, 1600, 1800, 1150, 1600, 1500]
let arrIDCard = [];
let numberCardBroad = 5;
let broadCard = [];
let count = 0;
let count1 = 0, count2 = 0;
let idImg = 0;
let poit1 = [];
let poit2 = [];

class Cards {
    constructor(id) {
        this.id = id;
        this.name = arrName[this.id];
        this.attack = arrAttack[this.id];
        this.defense = arrDefense[this.id];
        this.src = `/img/${this.id}.jpg`;
        this.status = "";
    }

    set setStatus(_status) {
        this.status = _status;
    }
}

class Player {
    constructor() {
        // this.name = name;
        this.hp = 3000;
        this.cards = "";
        this.arrCard = [];
    }

    setCards(cards) {
        this.cards = cards;
    }

    set setHP(hp) {
        this.hp = hp;
    }
}

let player1 = new Player();
let player2 = new Player();
for (let i = 0; i < 34; i++) {
    if (i % 2 == 0) {
        player1.arrCard.push(chooseCards())
    } else {
        player2.arrCard.push(chooseCards())
    }
}


console.log(player1.arrCard);
console.log(player2.arrCard);

function chooseCards() {
    let idRad
    do {
        idRad = Math.floor(Math.random() * 34+1);
    } while (arrIDCard.indexOf(idRad) != -1)
    //alert(arrIDCard)
    arrIDCard.push(idRad);
    return idRad;
}

function takeCardBorad(className) {
    // lay bai ra ban
    let str = ""

    for (let i = 0; i < numberCardBroad; i++) {
        if (numberCardBroad == 4 && count < 13) {
            str += `
              <img class="${className}"  style="height:100px;"    src="/img/sepci/ngang - Copy.jpg" >
              `
        } else
            str += `
              <img class="${className}"  style="height:100px; color: red;"  onclick="cardArena(this.className)"  src="/img/sepci/ngang - Copy.jpg" >
              `;
    }
    return str;
}

function openCard(status, className) {
    if (count < 35) {
        switch (className) {
            case 1:
                idImg = player1.arrCard[count];
                document.getElementById("openCard1").src = `/img/${idImg}.jpg`;
                document.getElementById("attack11").hidden = true;
                document.getElementById("defence12").hidden = true;
                document.getElementById("nameCard").innerHTML = "NameCard: " + " " + arrName[idImg - 1];
                document.getElementById("defen").innerHTML = "Defence:" + " " + arrDefense[idImg - 1];
                document.getElementById("pointAttack").innerHTML = "Attack:" + " " + arrAttack[idImg - 1];
                console.log(idImg)
                if (status == 'a') {
                    document.getElementById("status").innerHTML = "Status: Attack";
                    poit1.push(arrAttack[idImg - 1])
                } else {
                    document.getElementById("status").innerHTML = "Status: Defence";
                    poit1.push(arrDefense[idImg - 1])
                }
                if (document.getElementById("pl21").hidden == true) {
                    document.getElementById("pl21").hidden =false;
                }
                break;
            case 2:
                idImg = player2.arrCard[count];
                document.getElementById("openCard2").src = `/img/${idImg}.jpg`;
                document.getElementById("attack21").hidden = true;
                document.getElementById("defence22").hidden = true;
                document.getElementById("nameCard1").innerHTML = "NameCard: " + " " + arrName[idImg - 1];
                document.getElementById("defen1").innerHTML = "Defence:" + " " + arrDefense[idImg - 1];
                document.getElementById("pointAttack1").innerHTML = "Attack:" + " " + arrAttack[idImg - 1];
                if (status == 'a') {
                    document.getElementById("status1").innerHTML = "Status: Attack";
                    poit2.push(arrAttack[idImg - 1])
                } else {
                    document.getElementById("status1").innerHTML = "Status: Defence";
                    poit2.push(arrDefense[idImg - 1])
                }
                if (document.getElementById("pl11").hidden == true) {
                    document.getElementById("pl11").hidden =false;
                }
                break;
        }
    }
    console.log(count)
}

function display(className) {
    let strCard = takeCardBorad(className)
    if (className == "pl1") {
        document.getElementById("broadCard1").innerHTML = strCard;
        if (numberCardBroad == 4) {

            let str = `  <img id="openCard1" class="cardArena" src="/img/sepci/doc.jpg"  >
                           <button id="attack11" class="btn1"  onclick="openCard('a',1)"> Attack</button>
                            <button id="defence12" class="btn2" onclick="openCard('b',1)"> Defence</button>`
            document.getElementById("cardBroadPl1").innerHTML = str;
            count1++
        }
    } else {
        document.getElementById("broadCard2").innerHTML = strCard;
        if (numberCardBroad == 4) {
            let str1 = `<img id="openCard2" class="cardArena1"  src="/img/sepci/doc.jpg"  >
                         <button id="attack21" class="btn21" onclick="openCard('a',2)"> Attack</button>
                         <button id="defence22" class="btn22" onclick="openCard('b',2)"> Defence</button>`;
            document.getElementById("cardbroadPl2").innerHTML = str1;
            count2++
        }
    }
}

function cardArena(className) {
    numberCardBroad = 4;
    takeCardBorad(className);
    display(className);
}
function gameStart(className) {
    // chon bai
    let pl1 = document.getElementById("pl11");
    let pl2 = document.getElementById("pl21");
    if (className == "pl1") {
        pl1.hidden=true;
        if (count==0||count==1){ document.getElementById("count1").innerHTML=player1.arrCard.length-5}
        else {document.getElementById("count1").innerHTML=player1.arrCard.length-5-count1}
    } else {
        pl2.hidden=true
        if (count==0||count==1){ document.getElementById("count2").innerHTML=player2.arrCard.length-5}
        else {document.getElementById("count1").innerHTML=player1.arrCard.length-5-count2}
    }
    if(count)
        if (count % 2 == 0 && count > 1) {
            clear()
            let checkPoint = poit1[Math.floor(count / 2 - 1)] - poit2[Math.floor(count / 2 - 1)];
            if (checkPoint < 0 && player1.hp > 0) {
                player1.hp = +player1.hp + checkPoint;
                document.getElementById("point1").innerHTML = "Point :" + player1.hp;
                if (player1.hp <= 0) {
                    document.getElementById("result").innerText='lose';
                    document.cookie="game=lose"
                    alert("play1 lose and player 2 wwin")
                    return ;
                }
            } else if (checkPoint > 0 && player2.hp > 0) {
                player2.hp = +player2.hp - checkPoint;
                document.getElementById("point2").innerHTML = "Point :" + player2.hp;
                if (player2.hp <= 0) {
                    document.cookie="game=win"
                    document.getElementById("result").innerText='win';
                    alert("play2 lose and player 1 wwin")
                    return ;
                }
            }
        }
    if(player1.arrCard.length-count>=5) {
        numberCardBroad = 5;
    }else if (numberCardBroad>0) {
        numberCardBroad--;
    }else {
        let point1=player1.hp;
        let point2=player2.hp;
        if (point1>point2){
            alert("Player 1 win");
            document.cookie="game=win"
            document.getElementById("result").innerText='win';
            clear()
            return ;
        }else if(point1==point2){
            document.cookie="game=lose"
            document.getElementById("result").innerText='lose';
            alert("Player 2 win")
            clear()
            return ;
        }else {
            alert("Match Draw, you can play again ")
            clear()
            return ;
        }
    }
    count++
    display(className);
}

function clear() {
    // arrIDCard = [];
    let info=`<p id="nameCard">Name : </p>
                                        <p id="pointAttack">Attack: </p>
                                        <p id="defen"> Defen: </p>
                                        <p id="status" style="color: red"> Status: </p>`
    let info1=`<p id="nameCard1">Name : </p>
                                        <p id="pointAttack1">Attack: </p>
                                        <p id="defen1"> Defen: </p>
                                        <p id="status1" style="color: red"> Status: </p>`
    document.getElementById("cardBroadPl1").innerHTML="";
    document.getElementById("cardbroadPl2").innerHTML="";
    document.getElementById("info1").innerHTML=info;
    document.getElementById("info2").innerHTML=info1;
}