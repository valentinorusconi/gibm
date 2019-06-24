
//ArrayList: Ähnlich wie "String[]" nur beliebig Erweiter- und Verkleinerbar.
import java.util.ArrayList;
import java.util.Random;

public class Blackjack {

	private int balance = 1000, bet = 0;

	private java.util.List<String> pointsPC = new ArrayList<String>();
	private java.util.List<String> pointsPL = new ArrayList<String>();

	// Zufallsgenerator
	private Random r = new Random();

	// Setzt Wetteinsatz in "bet" Variable fest und zieht den Betrag von
	// "balance" ab.
	public void setBet(int betgui) {

		bet = betgui;
		balance = balance - bet;
	}

	// Gibt "balance" aus.
	public int getBalance() {
		return balance;
	}

	// Erstellung und gibt ein zufällige Zahl aus.
	public int getRandom() {
		int random = r.nextInt(12);
		return random;
	}

	// String aller möglichen Karten.
	public String[] Cards = { "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ass" };

	// Gibt die durch Zufallszahl ausgewählte Karte aus.
	public String getCard(int random) {
		String card = Cards[random];
		return card;
	}

	// Addiert Punkte zum Spielerkonto, je nach Karte unterschiedlich viel.
	public void setPointsPL(int number) {
		switch (number) {
		case 0:
			pointsPL.add("2");
			break;
		case 1:
			pointsPL.add("3");
			break;
		case 2:
			pointsPL.add("4");
			break;
		case 3:
			pointsPL.add("5");
			break;
		case 4:
			pointsPL.add("6");
			break;
		case 5:
			pointsPL.add("7");
			break;
		case 6:
			pointsPL.add("8");
			break;
		case 7:
			pointsPL.add("9");
			break;
		case 8:
			pointsPL.add("10");
			break;
		case 9:
			pointsPL.add("10");
			break;
		case 10:
			pointsPL.add("10");
			break;
		case 11:
			pointsPL.add("10");
			break;
		case 12:
			pointsPL.add("11");
			break;
		}
	}

	// Gibt die Punktzahl aus, welche sich an der stelle "index" befindet.
	public String getPointsPL(int index) {
		return pointsPL.get(index);
	}

	// Addiert Punkte zum Dealerkonto, je nach Karte unterschiedlich viel.
	public void setPointsPC(int number) {
		switch (number) {
		case 0:
			pointsPC.add("2");
			break;
		case 1:
			pointsPC.add("3");
			break;
		case 2:
			pointsPC.add("4");
			break;
		case 3:
			pointsPC.add("5");
			break;
		case 4:
			pointsPC.add("6");
			break;
		case 5:
			pointsPC.add("7");
			break;
		case 6:
			pointsPC.add("8");
			break;
		case 7:
			pointsPC.add("9");
			break;
		case 8:
			pointsPC.add("10");
			break;
		case 9:
			pointsPC.add("10");
			break;
		case 10:
			pointsPC.add("10");
			break;
		case 11:
			pointsPC.add("10");
			break;
		case 12:
			pointsPC.add("11");
			break;
		}
	}

	// Gibt die Punktzahl aus, welche sich an der stelle "index" befindet.
	public String getPointsPC(int index) {
		return pointsPC.get(index);
	}

}
