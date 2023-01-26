//
//  CardViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 21.1.2023.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var BlockView: UIStackView!
    @IBOutlet weak var StakkiView: UIStackView!
    @IBOutlet weak var NimiSukunimiLabel: UILabel!
    @IBOutlet weak var NuorisokortiLabe: UILabel!
    @IBOutlet weak var PuhelinLabel: UILabel!
    @IBOutlet weak var TanaanOnLabel: UILabel!
    @IBOutlet weak var SaaOttaKuvaLabel: UILabel!
    @IBOutlet weak var KuvaView: UIImageView!
    let MyConnectionClass = ConnectionToServer()
    
    var etunimisukunimi = ""
    var puhelin = ""
    var aktiv: Bool = false
    var kuvauslupa = ""
    
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
        shadow?.layer.borderWidth = 1
        BlockView.layer.zPosition = 1
        
        self.NimiSukunimiLabel.text = "\(etunimisukunimi)"
        self.PuhelinLabel.text = "Puhelin : \(puhelin)"
        let nyt = Date()
        self.TanaanOnLabel.text = nyt.formatted()
        if(aktiv)
        {
            BlockView.layer.zPosition = -1
        }
        if(kuvauslupa == "1")
        {
            SaaOttaKuvaLabel.text = "Nuoresta saa otta kuva"
        }else
        {
            SaaOttaKuvaLabel.text = "Nuoresta Ei saa otta kuva"

        }
    }
    
    override func reloadInputViews() {
//        self.MyConnectionClass.getCard(_username: self.etunimi)
        let shadow = StakkiView
        shadow?.layer.shadowColor = UIColor.black.cgColor
        shadow?.layer.shadowOpacity = 1
        shadow?.layer.shadowOffset = .zero
        shadow?.layer.shadowRadius = 20
        shadow?.layer.cornerRadius = 10
        shadow?.layer.borderColor = UIColor.black.cgColor
        shadow?.layer.borderWidth = 1
        BlockView.layer.zPosition = 1
    }
}






//guard let url = URL(string: "http://192.168.10.197:8888/test/index4.php?login=\(etunimi)") else {return}
//
//            URLSession.shared.dataTask(with: url){data, response, error in
//                if error != nil{return}
//                guard let data = data else {return}
//                do
//                {
//                    let users = try JSONDecoder().decode(User2.self, from: data)
//                    self.etunimi = (users.Etunimi)!
//                    self.sukunimi = (users.Sukunimi)!
//                    self.puhelin = (users.Puhelinnumero)!
////                    self.image = (users.first?.image)!
//                    self.voimassa = (users.Aktivointi)!
//                    print("********************\(self.voimassa)**********************")
//
////                    Funkito DispatchQueue.main.async anna päivittä tiedot näyttöllä
//                    DispatchQueue.main.async
//                    {
//                        if(self.voimassa == "1")
//                        {
//                            self.BlockView.layer.zPosition = -1
//                        }
//
//                        let nyt = Date()
//                        self.NimiSukunimiLabel.text = "Nimi : \(self.etunimi) \(self.sukunimi)"
//                        self.PuhelinLabel.text = "Puhelin : \(self.puhelin)"
//                        self.TanaanOnLabel.text = nyt.formatted()
//                    }
//
//
//                }
//                catch
//                {
//                        let LG = self.storyboard?.instantiateViewController(withIdentifier:"LoginNewViewController")
//                        self.navigationController?.pushViewController(LG!, animated: false)
//                }
//            }.resume()


//                    self.image = (users.first?.image)!
//                    self.print(self.image)
//                    self.guard let stringData = Data(base64Encoded: self.image),
//                          let uiImage = UIImage(data: stringData) else {
//                              print("Error: couldn't create UIImage")
//                              return
//                          }
