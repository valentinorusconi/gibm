import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.ArrayList;

public class Gui extends JFrame implements ActionListener {

	private JButton bNext, bBet, bHit, bStand, bDouble;
	private JLabel lblCardsPL, lblCardsPC, lblPointsPC, lblPointsPL, lblBalance, lblBet, lblDealer, lblPlayer;
	private JTextField txtBet;

	// Gui
	public Gui() {
		
		this.setSize(1200, 800);
		this.setLocation(350, 100);
		this.setLayout(null);
		this.setVisible(true);

		// Textfeld
		txtBet = new JTextField("");
		txtBet.setBounds(50, 35, 160, 20);
		txtBet.setForeground(Color.black);
		txtBet.setBackground(Color.yellow);
		this.add(txtBet);

		// Buttons
		bBet = new JButton("Bet!");
		bBet.setBounds(10, 65, 200, 35);
		bBet.setForeground(Color.black);
		bBet.setBackground(Color.yellow);
		bBet.addActionListener(this);
		this.add(bBet);

		bHit = new JButton("Hit!");
		bHit.setBounds(300, 600, 200, 35);
		bHit.setForeground(Color.black);
		bHit.setBackground(Color.yellow);
		bHit.addActionListener(this);
		this.add(bHit);
		bHit.setEnabled(false);

		bStand = new JButton("Stand!");
		bStand.setBounds(510, 600, 200, 35);
		bStand.setForeground(Color.black);
		bStand.setBackground(Color.yellow);
		bStand.addActionListener(this);
		this.add(bStand);
		bStand.setEnabled(false);

		bDouble = new JButton("Double!");
		bDouble.setBounds(720, 600, 200, 35);
		bDouble.setForeground(Color.black);
		bDouble.setBackground(Color.yellow);
		bDouble.addActionListener(this);
		this.add(bDouble);
		bDouble.setEnabled(false);

		bNext = new JButton("Next Round");
		bNext.setBounds(10, 105, 200, 35);
		bNext.setForeground(Color.black);
		bNext.setBackground(Color.yellow);
		bNext.addActionListener(this);
		this.add(bNext);
		bNext.setEnabled(false);

		// Labels
		lblDealer = new JLabel("Dealer Cards:");
		lblDealer.setBounds(450, 10, 150, 15);
		this.add(lblDealer);

		lblPlayer = new JLabel("Player Cards:");
		lblPlayer.setBounds(450, 300, 150, 50);
		this.add(lblPlayer);

		lblBet = new JLabel("Bet: ");
		lblBet.setBounds(10, 40, 200, 15);
		this.add(lblBet);

		lblBalance = new JLabel("Balance: 1000");
		lblBalance.setBounds(10, 10, 200, 15);
		lblBalance.setForeground(Color.black);
		lblBalance.setBackground(Color.yellow);
		this.add(lblBalance);

		lblPointsPC = new JLabel("Points Dealer: ");
		lblPointsPC.setBounds(10, 300, 150, 15);
		this.add(lblPointsPC);

		lblPointsPL = new JLabel("Points Player: ");
		lblPointsPL.setBounds(10, 320, 140, 15);
		this.add(lblPointsPL);

		lblCardsPL = new JLabel("Cards Player");
		lblCardsPL.setBounds(300, 400, 800, 200);
		lblCardsPL.setFont(new Font("Serif", Font.PLAIN, 120));
		this.add(lblCardsPL);

		lblCardsPC = new JLabel("Cards Dealer");
		lblCardsPC.setBounds(300, 70, 800, 200);
		lblCardsPC.setFont(new Font("Serif", Font.PLAIN, 120));
		this.add(lblCardsPC);

	}

	public void actionPerformed(ActionEvent event) {

		Blackjack bj = new Blackjack();
		int random = bj.getRandom();

		java.util.List<String> CardsPL = new ArrayList<String>();
		java.util.List<String> CardsPC = new ArrayList<String>();

		// Bet Button gedrückt:
		if (event.getSource() == bBet) {

			bj.setBet(Integer.parseInt(txtBet.getText()));
			txtBet.setEnabled(false);
			;
			bBet.setEnabled(false);
			lblBalance.setText(Integer.toString(bj.getBalance()));

			random = bj.getRandom();
			CardsPL.add(bj.getCard(random));
			bj.setPointsPL(random);

			random = bj.getRandom();
			CardsPL.add(bj.getCard(random));
			bj.setPointsPL(random);

			random = bj.getRandom();
			CardsPC.add(bj.getCard(random));
			bj.setPointsPC(random);

			lblCardsPC.setText(CardsPC.get(0) + ", ?");
			lblCardsPL.setText(CardsPL.get(0) + ", " + CardsPL.get(1));

			lblPointsPL.setText("Points Player: "
					+ Integer.toString((Integer.parseInt(bj.getPointsPL(1)) + (Integer.parseInt(bj.getPointsPL(2))))));
			lblPointsPC.setText("Points Dealer: " + bj.getPointsPC(0) + " + ?");

			if (bj.getPointsPL(1) == (bj.getPointsPL(2))) {
				bDouble.setEnabled(true);
			}

			bHit.setEnabled(true);
			bStand.setEnabled(true);

		}

		// Hit Button gedrückt:
		if (event.getSource() == bHit) {

		}

		// Stand Button gedrückt:
		if (event.getSource() == bStand) {
			
			random = bj.getRandom();
			CardsPC.add(bj.getCard(random));
			bj.setPointsPC(random);

			bHit.setEnabled(false);
			bStand.setEnabled(false);
			bDouble.setEnabled(false);

			lblPointsPC.setText("Points Dealer: " + Integer.toString((Integer.parseInt(bj.getPointsPC(0)) + (Integer.parseInt(bj.getPointsPC(0))))));
			;
//			lblCardsPC.setText(CardsPC.get(0) + ", " + CardsPC.get(1));

		}

		// Double Button gedrückt
		if (event.getSource() == bDouble) {

		}

	}

}
