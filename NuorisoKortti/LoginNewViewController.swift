//
//  LoginNewViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 5.1.2023.
//

import UIKit
import SwiftUI


class LoginNewViewController: UIViewController {
    private var username = ""
    private var pasword = ""
    let MyConnectionClass = ConnectionToServer()
    

    @IBOutlet weak var logintxt: UITextField!
    var loggedIn: Bool = false
    @IBOutlet weak var passworTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    
    @IBAction func nappiLogin(_ sender: UIButton)
    {
        self.MyConnectionClass.makeConnection(_userName: self.logintxt.text!, _password: self.passworTxt.text!)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
        vc.etunimi = self.logintxt.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}










//var request = URLRequest(url: URL (string: "http://192.168.10.197/test/index3.php?login=\(_username)&\(_password)")!)
//
//let task = URLSession.shared.dataTask(with: request)
//    {data, response, error in
//        print(String(decoding: data!, as: UTF8.self))
//        print(error)
//        do
//        {
//
//            let users = try JSONDecoder().decode([User2].self, from: data!)
//                    self.etunimi = (users.first?.Etunimi)!
//                    self.sukunimi = (users.first?.Sukunimi)!
//                    self.puhelin = (users.first?.Puhelinnumero)!
//                    self.passwordLbl.text = "Nimi :\(self.sukunimi) \(self.etunimi)"
//                    self.loginLbl.text = "Puhelin : \(self.puhelin)"
//
//
//        }
//        catch
//        {
//            let controllerLG = self.storyboard?.instantiateViewController(withIdentifier:"LoginNewViewController")
//            self.navigationController?.pushViewController(controllerLG!, animated: false)
//            print("****************************************************************************************************")
//            print(error)
//        }
//        return
//    }
//    task.resume()
//}
//
//}
//}






//var request = URLRequest(url: URL (string: "http://192.168.10.197/test/index3.php?login=\(_username)&\(_password)")!)
//
//let task = URLSession.shared.dataTask(with: request)
//    {data, response, error in
//        print(String(decoding: data!, as: UTF8.self))
//    do
//    {
//        let users = try JSONDecoder().decode([User].self, from: data!)
//        self.username = (users.first?.Kayttajanimi)!
//        self.loggedIn = true
//
//    }
//    catch
//    {
//        print("******************WRONG PASSWORD *********************")
//        return
//    }
//
//}
//    task.resume()
