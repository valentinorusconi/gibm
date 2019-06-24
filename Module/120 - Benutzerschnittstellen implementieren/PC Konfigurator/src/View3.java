import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.BoxLayout;
import java.awt.GridLayout;
import java.awt.Point;

import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;
import java.awt.Color;
import java.awt.Canvas;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JRadioButton;
import javax.swing.JTable;

public class View3 extends JFrame {
	public View3() {
		getContentPane().setBackground(Color.WHITE);
		setTitle("PC-Konfigurator");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JLabel lblLbltitle = new JLabel("Bestell\u00FCbersicht");
		lblLbltitle.setHorizontalAlignment(SwingConstants.LEFT);
		lblLbltitle.setFont(new Font("Arial", Font.BOLD, 16));
		
		JButton btnWeiter = new JButton("Weiter");
		btnWeiter.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		
		JButton btnZurck = new JButton("Zur\u00FCck");
		
		JLabel lblKonmfiguration = new JLabel("Konfiguration");
		lblKonmfiguration.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		
		JLabel lblNewLabel = new JLabel("GEH\u00C4USE");
		
		JLabel lblCpu = new JLabel("CPU");
		
		JLabel lblMainboard = new JLabel("MAINBOARD");
		
		JLabel lblGrafikkarte = new JLabel("GRAFIKKARTE");
		
		JLabel lblArbeitsspeicher = new JLabel("ARBEITSSPEICHER");
		
		JLabel lblFestplatte = new JLabel("FESTPLATTE");
		
		JLabel lblLaufwerk = new JLabel("LAUFWERK");
		
		JLabel lblNetzteil = new JLabel("NETZTEIL");
		
		JLabel lblCpukhler = new JLabel("CPU-K\u00DCHLER");
		
		JLabel lblNewLabel_1 = new JLabel("Cooler Master - N300 schwarz");
		
		JLabel lblNewLabel_2 = new JLabel("AMD Piledriver FX-6300, 6x 3.5GHz, 6MB L2-Cache");
		
		JLabel lblNewLabel_3 = new JLabel("MSI 970A-G43 Plus | AMD 970");
		
		JLabel lblNewLabel_4 = new JLabel("AMD Radeon RX 460 4GB | Sapphire Nitro");
		
		JLabel lblNewLabel_5 = new JLabel("8GB DDR3-1600 | 2x 4GB");
		
		JLabel lblNewLabel_6 = new JLabel("1TB Seagate BarraCuda");
		
		JLabel lblNewLabel_7 = new JLabel("DVD-Brenner 24x ASUS DRW-24F1MT");
		
		JLabel lblNewLabel_8 = new JLabel("400W - be quiet! System Power 8");
		
		JLabel lblNewLabel_9 = new JLabel("AMD Boxed K\u00FChler");
		
		JLabel lblPersnlicheDaten = new JLabel("Pers\u00F6nliche Daten\r\n");
		lblPersnlicheDaten.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		
		JLabel lblHerr = new JLabel("Herr");
		
		JLabel lblMaxMustermann = new JLabel("Max Mustermann");
		
		JLabel lblMusterstrasse = new JLabel("Musterstrasse 1");
		
		JLabel lblMusterde = new JLabel("1000 Muster (DE)");
		
		JLabel lblTelefon = new JLabel("Telefon: 123 456 78 90");
		
		JLabel lblEmailMaxmusterde = new JLabel("E-Mail: max@muster.de");
		
		JLabel lblKostenbersicht = new JLabel("Kosten\u00FCbersicht\r\n");
		lblKostenbersicht.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		
		JLabel lblxPcKonfiguration = new JLabel("1x PC Konfiguration");
		
		JLabel lblVersandtDeutschland = new JLabel("Versand Deutschland");
		
		JLabel lblGesamt = new JLabel("Gesamt");
		
		JLabel label = new JLabel("520.00");
		label.setHorizontalAlignment(SwingConstants.RIGHT);
		
		JLabel label_1 = new JLabel("15.00");
		label_1.setHorizontalAlignment(SwingConstants.RIGHT);
		
		JLabel label_2 = new JLabel("535.00");
		label_2.setHorizontalAlignment(SwingConstants.RIGHT);
		
		JButton btnNewButton = new JButton("Bestellen");
		GroupLayout groupLayout = new GroupLayout(getContentPane());
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(25)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
							.addComponent(lblGesamt)
							.addContainerGap())
						.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
							.addGroup(groupLayout.createSequentialGroup()
								.addComponent(lblVersandtDeutschland)
								.addContainerGap())
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout.createSequentialGroup()
									.addComponent(lblxPcKonfiguration)
									.addContainerGap())
								.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
									.addGroup(groupLayout.createSequentialGroup()
										.addComponent(lblKostenbersicht, GroupLayout.PREFERRED_SIZE, 128, GroupLayout.PREFERRED_SIZE)
										.addContainerGap())
									.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addGroup(groupLayout.createSequentialGroup()
											.addComponent(lblMusterde)
											.addContainerGap())
										.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
											.addGroup(groupLayout.createSequentialGroup()
												.addComponent(lblMusterstrasse)
												.addContainerGap())
											.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
												.addGroup(groupLayout.createSequentialGroup()
													.addComponent(lblMaxMustermann)
													.addContainerGap())
												.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
													.addGroup(groupLayout.createSequentialGroup()
														.addComponent(lblHerr)
														.addContainerGap())
													.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
														.addGroup(groupLayout.createSequentialGroup()
															.addComponent(lblPersnlicheDaten, GroupLayout.PREFERRED_SIZE, 128, GroupLayout.PREFERRED_SIZE)
															.addContainerGap())
														.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
															.addGroup(groupLayout.createSequentialGroup()
																.addComponent(lblCpukhler)
																.addContainerGap())
															.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																.addGroup(groupLayout.createSequentialGroup()
																	.addComponent(lblNetzteil)
																	.addContainerGap())
																.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																	.addGroup(groupLayout.createSequentialGroup()
																		.addComponent(lblLaufwerk)
																		.addContainerGap())
																	.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																		.addGroup(groupLayout.createSequentialGroup()
																			.addComponent(lblFestplatte)
																			.addContainerGap())
																		.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																			.addGroup(groupLayout.createSequentialGroup()
																				.addComponent(lblArbeitsspeicher)
																				.addContainerGap())
																			.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																				.addGroup(groupLayout.createSequentialGroup()
																					.addComponent(lblGrafikkarte)
																					.addContainerGap())
																				.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																						.addGroup(groupLayout.createSequentialGroup()
																							.addComponent(lblKonmfiguration, GroupLayout.PREFERRED_SIZE, 90, GroupLayout.PREFERRED_SIZE)
																							.addContainerGap())
																						.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																							.addGroup(groupLayout.createSequentialGroup()
																								.addComponent(lblLbltitle, GroupLayout.PREFERRED_SIZE, 267, GroupLayout.PREFERRED_SIZE)
																								.addContainerGap(292, Short.MAX_VALUE))
																							.addGroup(groupLayout.createSequentialGroup()
																								.addComponent(btnZurck, GroupLayout.PREFERRED_SIZE, 75, GroupLayout.PREFERRED_SIZE)
																								.addPreferredGap(ComponentPlacement.RELATED, 594, Short.MAX_VALUE)
																								.addComponent(btnWeiter)
																								.addGap(23))))
																					.addGroup(groupLayout.createSequentialGroup()
																						.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																							.addComponent(lblNewLabel)
																							.addComponent(lblCpu)
																							.addComponent(lblMainboard))
																						.addGap(79)
																						.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																							.addComponent(lblNewLabel_3)
																							.addComponent(lblNewLabel_2)
																							.addComponent(lblNewLabel_1)
																							.addComponent(lblNewLabel_5)
																							.addComponent(lblNewLabel_6)
																							.addComponent(lblNewLabel_8)
																							.addComponent(lblNewLabel_9)
																							.addComponent(lblTelefon)
																							.addComponent(lblEmailMaxmusterde)
																							.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING, false)
																								.addComponent(label_1, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
																								.addComponent(label, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
																								.addComponent(label_2))
																							.addComponent(lblNewLabel_7)
																							.addComponent(lblNewLabel_4))
																						.addGap(373)))))))))))))))))))
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(218)
					.addComponent(btnNewButton, GroupLayout.PREFERRED_SIZE, 163, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(401, Short.MAX_VALUE))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblLbltitle, GroupLayout.PREFERRED_SIZE, 39, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblKonmfiguration)
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel)
						.addComponent(lblNewLabel_1))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblCpu)
						.addComponent(lblNewLabel_2))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblMainboard)
						.addComponent(lblNewLabel_3))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblGrafikkarte)
						.addComponent(lblNewLabel_4))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblArbeitsspeicher)
						.addComponent(lblNewLabel_5))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblFestplatte)
						.addComponent(lblNewLabel_6))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblLaufwerk)
						.addComponent(lblNewLabel_7))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNetzteil)
						.addComponent(lblNewLabel_8))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblCpukhler)
						.addComponent(lblNewLabel_9))
					.addGap(44)
					.addComponent(lblPersnlicheDaten)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblHerr)
						.addComponent(lblTelefon))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblMaxMustermann)
						.addComponent(lblEmailMaxmusterde))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblMusterstrasse)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblMusterde)
					.addGap(32)
					.addComponent(lblKostenbersicht)
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblxPcKonfiguration)
						.addComponent(label))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblVersandtDeutschland)
						.addComponent(label_1))
					.addGap(26)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblGesamt)
						.addComponent(label_2))
					.addGap(61)
					.addComponent(btnNewButton, GroupLayout.PREFERRED_SIZE, 54, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED, 88, Short.MAX_VALUE)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnZurck)
						.addComponent(btnWeiter))
					.addContainerGap())
		);
		getContentPane().setLayout(groupLayout);
		this.setSize(600, 800);
	}
}
