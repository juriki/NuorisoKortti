//
//  SecondCarViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 20.5.2023.
//

import UIKit

class SecondCarViewController: UIViewController {

    @IBOutlet weak var StakkiView: UIView!
    @IBOutlet weak var NuoriId: UILabel!
//    @IBOutlet weak var StakkiView: UIStackView!
    @IBOutlet weak var Puhelinnumero: UILabel!
    @IBOutlet weak var Kayttajanimi: UILabel!
    @IBOutlet weak var Sahkopisti: UILabel!
    @IBOutlet weak var SyntymaAika: UILabel!
    @IBOutlet weak var Allergiat: UILabel!
    @IBOutlet weak var Osoite: UILabel!
    @IBOutlet weak var Nimi: UILabel!
    var tallennusPaikka = nuoriTallenusPaikka()
    
    @IBOutlet weak var SaaOttaKuva: UILabel!
    
    @IBAction func LogOut(_ sender: Any) {
        //            Alustetaan Käyttäjän muisti
                    tallennusPaikka.poista()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let shadow = StakkiView
        shadow?.layer.shadowColor = UIColor.black.cgColor
        shadow?.layer.shadowOpacity = 1
        shadow?.layer.shadowOffset = .zero
        shadow?.layer.shadowRadius = 20
        shadow?.layer.cornerRadius = 10
        shadow?.layer.borderColor = UIColor.black.cgColor
        shadow?.layer.borderWidth = 0.5



        Nimi.text = "Nimi : " + tallennusPaikka.tarkista(key: "Etunimi") + " " + tallennusPaikka.tarkista(key: "Sukunimi")
        Puhelinnumero.text = "Puhelinnumero : " + tallennusPaikka.tarkista(key: "Puhelinnumero")
        Kayttajanimi.text = "Käyttäjänimi " + tallennusPaikka.tarkista(key: "Kayttajanimi")
        Sahkopisti.text = "Sähköposti : " + tallennusPaikka.tarkista(key: "Sähköposti")
        SyntymaAika.text = "Syntymä aika : " + tallennusPaikka.tarkista(key: "SyntymäAika")
        Allergiat.text = "Allergiat : " + tallennusPaikka.tarkista(key: "Allergiat")
        Osoite.text = "Osoite: " + tallennusPaikka.tarkista(key: "Osoite")
        NuoriId.text = "Nuori ID: " + String(tallennusPaikka.tarkista(key: "NuoriID"))
    }
    

}
