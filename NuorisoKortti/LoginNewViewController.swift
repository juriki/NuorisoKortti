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
    let MyPasswordClass = ConnectionToServer()
    
    @IBOutlet weak var logintxt: UITextField!
    @IBOutlet weak var NappiKirjaudu: UIButton!
    @IBOutlet weak var passworTxt: UITextField!


//Login ruutun tarkistus
    @IBAction func logintxtChanged(_ sender: Any)
    {
        if(passworTxt.text!.count >= 8 && logintxt.text!.count >= 4)
        {
            NappiKirjaudu.isEnabled = true
            self.MyPasswordClass.makeConnection(_userName: self.logintxt.text!, _password: self.passworTxt.text!)
            self.MyConnectionClass.getCard(_username: self.logintxt.text!)
        }
        else
        {
            NappiKirjaudu.isEnabled = false
        }
    }
    
    
    @IBAction func passwordChanged(_ sender: Any) {
        if(passworTxt.text!.count >= 8 && logintxt.text!.count >= 4)
        {
            NappiKirjaudu.isEnabled = true
            self.MyPasswordClass.makeConnection(_userName: self.logintxt.text!, _password: self.passworTxt.text!)
            self.MyConnectionClass.getCard(_username: self.logintxt.text!)
        }
        else
        {
            NappiKirjaudu.isEnabled = false
        }

        }
    
    
//    Main

    override func viewDidLoad() {
        super.viewDidLoad()
        NappiKirjaudu.isEnabled = false
        logintxt.text = ""
        passworTxt.text = ""
        }
    
    
    
//    Nappi Painaminen
    @IBAction func nappiLogin(_ sender: UIButton)
    {
        var huomio =  MyConnectionClass.username
        if(huomio == "")
        {
            huomio = MyPasswordClass.password
        }
        let allert = UIAlertController(title: "Huomio!", message: huomio, preferredStyle: .alert)
        allert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{action in
            print("dismis")
            
        }))
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
        if(MyPasswordClass.islogged)
        {
            vc.aktiv = MyConnectionClass.aktivoitu
            vc.etunimisukunimi = " \(MyConnectionClass.etunimi) \(MyConnectionClass.sukunimi)"
            vc.puhelin = MyConnectionClass.puhelin
            vc.kuvauslupa = MyConnectionClass.kuvalupa
            self.MyConnectionClass.getCard(_username: self.logintxt.text!)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            present(allert, animated: true)
        }
        
    }
}
