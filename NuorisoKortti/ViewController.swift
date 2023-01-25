//
//  ViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 15.11.2022.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
    
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var loginLbl: UILabel!
    var username = ""
    var etunimi = ""
    var sukunimi = ""
    var puhelin = ""
    var password = ""
    var image = ""
    
        override func viewDidLoad() {
        super.viewDidLoad()
        loginLbl.text = username
 
        guard let url = URL(string: "http://192.168.10.197:8888/test/index4.php?login=\(username)&password=12345") else {return}
        
        URLSession.shared.dataTask(with: url){data, response, error in
            if let error = error{return}
            
            guard let data = data else {return}
            do
            {
                let users = try JSONDecoder().decode(User2.self, from: data)
                self.etunimi = (users.Etunimi)!
                self.sukunimi = (users.Sukunimi)!
                self.puhelin = (users.Puhelinnumero)!
//                self.image = (users.image)!
                self.passwordLbl.text = "Nimi :\(self.sukunimi) \(self.etunimi)"
                self.loginLbl.text = "Puhelin : \(self.puhelin)"
                print(self.image)
                guard let stringData = Data(base64Encoded: self.image),
                      let uiImage = UIImage(data: stringData) else {
                          print("Error: couldn't create UIImage")
                          return
                      }

            }
            catch
            {
            let LG = self.storyboard?.instantiateViewController(withIdentifier:"LoginNewViewController")
                self.navigationController?.pushViewController(LG!, animated: false)
            }
        }.resume()
    }
    
    @IBOutlet weak var iloinenAskolaa: UIImageView!
    

    
    func kirjaudu(img: UIImageView, button: UIButton)
    {
        if button.currentTitle != "Näytä Kortti"
        {
            button.setTitle("Näytä Kortti", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9851589799, green: 0.920853138, blue: 0, alpha: 1)
            img.isHidden = true
        }
        else
        {
            button.setTitle("\(username) \(sukunimi) ", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            img.isHidden = false
            
        }
    }
    
    
}

