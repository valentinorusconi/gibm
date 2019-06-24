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

public class View2 extends JFrame {
	private JTextField txtMax;
	private JTextField txtMustermann;
	private JTextField txtMusterstrasse;
	private JTextField txtMuster;
	private JTextField textField_6;
	private JTextField txtMaxmustercom;
	public View2() {
		getContentPane().setBackground(Color.WHITE);
		setTitle("PC-Konfigurator");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JLabel lblLbltitle = new JLabel("Kontaktdaten");
		lblLbltitle.setHorizontalAlignment(SwingConstants.LEFT);
		lblLbltitle.setFont(new Font("Arial", Font.BOLD, 16));
		
		JButton btnWeiter = new JButton("Weiter");
		btnWeiter.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		
		JButton btnZurck = new JButton("Zur\u00FCck");
		btnZurck.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				v1.setVisible(true);
			}
		});
		
		JLabel lblAnrede = new JLabel("Anrede");
		
		JLabel lblVorname = new JLabel("Vorname");
		
		JLabel lblNachname = new JLabel("Nachname");
		
		JLabel lblStrassenr = new JLabel("Strasse/Nr");
		
		JLabel lblPlzort = new JLabel("PLZ/Ort");
		
		JLabel lblLand = new JLabel("Land");
		
		JLabel lblTelefon = new JLabel("Telefon");
		
		JLabel lblEmail = new JLabel("E-Mail");
		
		JLabel lblBezahlung = new JLabel("Bezahlung");
		
		txtMax = new JTextField();
		txtMax.setText("Max");
		txtMax.setColumns(10);
		
		txtMustermann = new JTextField();
		txtMustermann.setText("Mustermann");
		txtMustermann.setColumns(10);
		
		txtMusterstrasse = new JTextField();
		txtMusterstrasse.setText("Musterstrasse 1\r\n");
		txtMusterstrasse.setColumns(10);
		
		txtMuster = new JTextField();
		txtMuster.setText("1000 Muster");
		txtMuster.setColumns(10);
		
		textField_6 = new JTextField();
		textField_6.setText("123 456 78 90\r\n");
		textField_6.setColumns(10);
		
		txtMaxmustercom = new JTextField();
		txtMaxmustercom.setText("max@muster.com\r\n");
		txtMaxmustercom.setColumns(10);
		
		JRadioButton rdbtnVorkasse = new JRadioButton("Vorkasse");
		
		JRadioButton rdbtnPaypal = new JRadioButton("Paypal");
		rdbtnPaypal.setSelected(true);
		
		JRadioButton rdbtnSofortberweisung = new JRadioButton("SOFORT \u00DCBERWEISUNG");
		
		JRadioButton rdbtnKreditkarte = new JRadioButton("Kreditkarte");
		
		JRadioButton rdbtnBarzahlungBeiAbholung = new JRadioButton("Barzahlung bei Abholung");
		
		JLabel lblLieferart = new JLabel("Lieferart:");
		
		JRadioButton rdbtnKostenloserVersandt = new JRadioButton("Versand - 15.00 EUR\r\n");
		
		JRadioButton rdbtnSelbstabholung = new JRadioButton("Selbstabholung - 00.00 EUR\r\n\r\n");
		rdbtnSelbstabholung.setSelected(true);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setModel(new DefaultComboBoxModel(new String[] {"Frau", "Herr"}));
		
		JComboBox comboBox_1 = new JComboBox();
		comboBox_1.setModel(new DefaultComboBoxModel(new String[] {"Deutschland", "\u00D6sterreich", "Schweiz"}));
		GroupLayout groupLayout = new GroupLayout(getContentPane());
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(25)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
							.addComponent(lblLieferart)
							.addContainerGap())
						.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
							.addGroup(groupLayout.createSequentialGroup()
								.addComponent(lblBezahlung)
								.addContainerGap())
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout.createSequentialGroup()
									.addComponent(lblEmail)
									.addContainerGap())
								.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
									.addGroup(groupLayout.createSequentialGroup()
										.addComponent(lblTelefon)
										.addContainerGap())
									.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addGroup(groupLayout.createSequentialGroup()
											.addComponent(lblLand)
											.addContainerGap())
										.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
											.addGroup(groupLayout.createSequentialGroup()
												.addComponent(lblPlzort)
												.addContainerGap())
											.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
												.addGroup(groupLayout.createSequentialGroup()
													.addComponent(lblStrassenr)
													.addContainerGap())
												.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
													.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
														.addGroup(groupLayout.createSequentialGroup()
															.addComponent(lblLbltitle, GroupLayout.PREFERRED_SIZE, 267, GroupLayout.PREFERRED_SIZE)
															.addContainerGap(292, Short.MAX_VALUE))
														.addGroup(groupLayout.createSequentialGroup()
															.addComponent(btnZurck, GroupLayout.PREFERRED_SIZE, 75, GroupLayout.PREFERRED_SIZE)
															.addPreferredGap(ComponentPlacement.RELATED, 396, Short.MAX_VALUE)
															.addComponent(btnWeiter)
															.addGap(23)))
													.addGroup(groupLayout.createSequentialGroup()
														.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
															.addComponent(lblAnrede)
															.addComponent(lblVorname)
															.addComponent(lblNachname))
														.addGap(72)
														.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
															.addComponent(comboBox, 0, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
															.addComponent(txtMustermann)
															.addComponent(txtMax)
															.addComponent(txtMusterstrasse)
															.addComponent(txtMuster)
															.addComponent(textField_6)
															.addComponent(txtMaxmustercom)
															.addComponent(rdbtnVorkasse, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 186, Short.MAX_VALUE)
															.addComponent(rdbtnPaypal, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
															.addComponent(rdbtnSofortberweisung, GroupLayout.DEFAULT_SIZE, 186, Short.MAX_VALUE)
															.addComponent(rdbtnKreditkarte, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 186, Short.MAX_VALUE)
															.addComponent(rdbtnBarzahlungBeiAbholung, GroupLayout.DEFAULT_SIZE, 186, Short.MAX_VALUE)
															.addComponent(rdbtnKostenloserVersandt, GroupLayout.DEFAULT_SIZE, 186, Short.MAX_VALUE)
															.addComponent(rdbtnSelbstabholung, GroupLayout.DEFAULT_SIZE, 186, Short.MAX_VALUE)
															.addComponent(comboBox_1, 0, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
														.addGap(251)))))))))))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblLbltitle, GroupLayout.PREFERRED_SIZE, 39, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblAnrede)
						.addComponent(comboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblVorname)
						.addComponent(txtMax, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNachname)
						.addComponent(txtMustermann, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblStrassenr)
						.addComponent(txtMusterstrasse, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblPlzort)
						.addComponent(txtMuster, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblLand)
						.addComponent(comboBox_1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(26)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblTelefon)
						.addComponent(textField_6, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblEmail)
						.addComponent(txtMaxmustercom, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(55)
					.addComponent(lblBezahlung)
					.addGap(18)
					.addComponent(rdbtnVorkasse)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(rdbtnPaypal)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(rdbtnSofortberweisung)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(rdbtnKreditkarte)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(rdbtnBarzahlungBeiAbholung)
					.addGap(29)
					.addComponent(lblLieferart)
					.addGap(15)
					.addComponent(rdbtnKostenloserVersandt)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(rdbtnSelbstabholung)
					.addPreferredGap(ComponentPlacement.RELATED, 143, Short.MAX_VALUE)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnZurck)
						.addComponent(btnWeiter))
					.addContainerGap())
		);
		getContentPane().setLayout(groupLayout);
		this.setSize(600, 800);
	}
}
