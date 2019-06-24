import java.util.Random;
import java.util.Scanner;

public class roulett {

	public static void main(String[] args) {
		int kontostand = 5000, i = 0, runde = 0; 
		Random zufall = new Random();
		Scanner eingabe = new Scanner(System.in);
		String weiterspielen = "nein";
		do {
			i = 0;
			String wahl[] = new String[9999];
			int einsatz[] = new int[9999];
			String mehreinsatz = "ja";
			while (mehreinsatz.equalsIgnoreCase("ja") || mehreinsatz.equalsIgnoreCase("j") && i <= 9998 && kontostand > 0) {
				System.out.println("Aktueller Kontostand: " + kontostand + "       Dies ist Ihre " + (i+1) + ". Wette.");
				System.out.print("Auf was wollen Sie setzen? (rot, schwarz, gerade, ungerade, zahl (0-36): ");
				wahl[i] = eingabe.next();
				System.out.print("Wieviel wollen sie darauf setzen?");
				einsatz[i] = eingabe.nextInt();
				while (einsatz[i] > kontostand) {
					System.out.println("Sie haben nicht mehr gen�gend Guthaben f�r diesen Einsatz! Versuchen Sie es mit einem kleineren Einsatz:");
					System.out.println("Ihr aktueller Kontostand betr�gt " + kontostand + ".");
					System.out.print("Neuer Einsatz: ");
					einsatz[i] = eingabe.nextInt();
				}
				kontostand = kontostand - einsatz[i];
				if (kontostand <= 0) {
					System.out.println("Ihr Kontostand ist zu gering (" + kontostand + ") um noch eine Wette zu platzieren.");
					mehreinsatz = "nein";
				} else {
					System.out.print("Noch einen Einsatz t�tigen? ");
					mehreinsatz = eingabe.next();
				}
				System.out.println("------------------------------------------------------------------------------------------------------------------------------------------------------------------");
				i = i + 1;
			}
			int zahl = zufall.nextInt(37);
			System.out.println("Gewinnzahl: " + zahl + ", " + colour(zahl));
			kontostand = pr�fen(wahl, einsatz, zahl, kontostand);
			if (kontostand <= 0) {
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				System.out.println("Ihr Kontostand betr�gt nun " + kontostand + "! Somit haben Sie ihr Guthaben nach " + runde + " Spielen verloren!");
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				System.exit(1);
			} else {
				System.out.println("Aktueller Kontostand: " + kontostand);
			}
			
			runde = runde + 1;
			System.out.print("Weitere Runde spielen? ");
			weiterspielen = eingabe.next();
			System.out.println("------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			
		} while (weiterspielen.equalsIgnoreCase("ja") || weiterspielen.equalsIgnoreCase("j"));
	System.out.println("Sie haben ihr Spiel mit einem Kontostand von " + kontostand + " nach " + runde + " Spielen beendet.");
	}
	
	public static int pr�fen(String wahl[],int einsatz[],int zahl, int kontostand) {
		for (int i = 0;i <= 9998; i++) {
			if (wahl[i] == null) {
				
			} else if (wahl[i].equalsIgnoreCase("schwarz") || wahl[i].equalsIgnoreCase("s")) {
				if (schwarz(zahl) == true){
					kontostand = kontostand + 2*(einsatz[i]);
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " gewonnen!");
				} else {
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " verloren!");
				}
			} else if (wahl[i].equalsIgnoreCase("rot") || wahl[i].equalsIgnoreCase("r")) {
				if (rot(zahl) == true){
					kontostand = kontostand + 2*(einsatz[i]);
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " gewonnen!");
				} else {
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " verloren!");
				}
			} else if (wahl[i].equalsIgnoreCase("gerade") || wahl[i].equalsIgnoreCase("g")) {
				if (gerade(zahl) == true){
					kontostand = kontostand + 2*(einsatz[i]);
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " gewonnen!");
				} else {
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " verloren!");
				}
			} else if (wahl[i].equalsIgnoreCase("ungerade") || wahl[i].equalsIgnoreCase("u")) {
				if (ungerade(zahl) == true){
					kontostand = kontostand + 2*(einsatz[i]);
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " gewonnen!");
				} else {
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " verloren!");
				}
			} else if (zahl == Integer.parseInt(wahl[i])) {
					kontostand = kontostand + 35*(einsatz[i]);
					System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " gewonnen!");
			} else {
				System.out.println("Sie haben ihre " + (i+1) + ". Wette auf " + wahl[i] + " in der H�he von " + einsatz[i] + " verloren!");
			}
			}
		return kontostand;
		
	}
	
	public static boolean schwarz(int zahlschwarz) {
		switch (zahlschwarz) {
		case 2: return true;
		case 4: return true;
		case 6: return true;
		case 8: return true;
		case 10: return true;
		case 11: return true;
		case 13: return true;
		case 15: return true;
		case 17: return true;
		case 20: return true;
		case 22: return true;
		case 24: return true;
		case 26: return true;
		case 28: return true;
		case 29: return true;
		case 31: return true;
		case 33: return true;
		case 35: return true;
		default: return false;
		}
		
	}
	
	public static boolean rot(int zahlrot) {
		switch (zahlrot) {
		case 1: return true;
		case 3: return true;
		case 5: return true;
		case 7: return true;
		case 9: return true;
		case 12: return true;
		case 14: return true;
		case 16: return true;
		case 18: return true;
		case 19: return true;
		case 21: return true;
		case 23: return true;
		case 25: return true;
		case 27: return true;
		case 30: return true;
		case 32: return true;
		case 34: return true;
		case 36: return true;
		default: return false;
		}
		
	}
	
	public static boolean gerade(int zahlgerade) {
		switch (zahlgerade) {
		case 2: return true;
		case 4: return true;
		case 6: return true;
		case 8: return true;
		case 10: return true;
		case 12: return true;
		case 14: return true;
		case 16: return true;
		case 18: return true;
		case 20: return true;
		case 22: return true;
		case 24: return true;
		case 26: return true;
		case 28: return true;
		case 30: return true;
		case 32: return true;
		case 34: return true;
		case 36: return true;
		default: return false;
		}
		
	}
	
	public static boolean ungerade(int zahlungerade) {
		switch (zahlungerade) {
		case 1: return true;
		case 3: return true;
		case 5: return true;
		case 7: return true;
		case 9: return true;
		case 11: return true;
		case 13: return true;
		case 15: return true;
		case 17: return true;
		case 19: return true;
		case 21: return true;
		case 23: return true;
		case 25: return true;
		case 27: return true;
		case 29: return true;
		case 31: return true;
		case 33: return true;
		case 35: return true;
		default: return false;
		}
		
	}

	public static String colour(int number) {
		
		if (number == 1 ) {
		    return ("Rot, ungerade");}
		if (number == 2){
		    return ("Schwarz, gerade");}
		if (number == 3) {
		    return ("Rot, ungerade");}
		if (number == 4) {
		    return ("Schwarz, gerade");}
		if (number == 5) {
		    return ("Rot, ungerade");}
		if (number == 6) {
		    return ("Schwarz, gerade");}
		if (number == 7) {
		    return ("Rot, ungerade");}
		if (number == 8) {
		    return ("Schwarz, gerade");}
		if (number == 9) {
		    return ("Rot, ungerade");}
		if (number == 10) {
		    return ("Schwarz, gerade");}
		if (number == 11) {
		    return ("Schwarz, ungerade");}
		if (number == 12) {
		    return ("Rot, gerade");}
		if (number == 13) {
		    return ("Schwarz, ungerade");}
		if (number == 14) {
		    return ("Rot, gerade");}
		if (number == 15) {
		    return ("Schwarz, ungerade");}
		if (number == 16) {
		    return ("Rot, gerade");}
		if (number == 17) {
		    return ("Schwarz, ungerade");}
		if (number == 18) {
		    return ("Rot, gerade");}
		if (number == 19) {
		    return ("Rot, ungerade");}
		if (number == 20) {
		    return ("Schwarz, gerade");}
		if (number == 21) {
		    return ("Rot, ungerade");}
		if (number == 22) {
		    return ("Schwarz, gerade");}
		if (number == 23) {
		    return ("Rot, ungerade");}
		if (number == 24) {
		    return ("Schwarz, gerade");}
		if (number == 25) {
		    return ("Rot, ungerade");}
		if (number == 26) {
		    return ("Schwarz, gerade");}
		if (number == 27) {
		    return ("Rot, ungerade");}
		if (number == 28) {
		    return ("Schwarz, gerade");}
		if (number == 29) {
		    return ("Schwarz, ungerade");}
		if (number == 30) {
		    return ("Rot, gerade");}
		if (number == 31) {
		    return ("Schwarz, ungerade");}
		if (number == 32) {
		    return ("Rot, gerade");}
		if (number == 33) {
		    return ("Schwarz, ungerade");}
		if (number == 34) {
		    return ("Rot, gerade");}
		if (number == 35) {
		    return ("Schwarz, ungerade");}
		if (number == 36) {
		    return ("Rot, gerade");}
		if (number == 0) {
		    return ("Gr�n");}
		return null;
		
	} 
}

