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
            self.MyConnectionClass.getCard(_username: self.logintxt.text!)
            self.MyPasswordClass.makeConnection(_userName: self.logintxt.text!, _password: self.passworTxt.text!)

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
            self.MyConnectionClass.getCard(_username: self.logintxt.text!)
            if(MyConnectionClass.aktivoitu == true)
            {
                self.MyPasswordClass.makeConnection(_userName: self.logintxt.text!, _password: self.passworTxt.text!)
            }
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
    
    
    
//    Nappin Painaminen
    @IBAction func nappiLogin(_ sender: UIButton)
    {
//        Huomautuus
        var huomio =  MyConnectionClass.username
        if(huomio == "")
        {
            huomio = MyPasswordClass.password
        }
        
        let allert = UIAlertController(title: "Huomio!", message: huomio, preferredStyle: .alert)
            allert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{action in
            print("dismis")
        }))
        
//        tällä vc muuttuja lähettä tiedot seuravaan näyttöön
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController

//        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "SecondCarViewController") as! SecondCarViewController
        if(MyPasswordClass.islogged)
        {
            vc.nuoriID = MyConnectionClass.nuoriId
//            vc2.nimi = "PIZDEC" 
            vc.aktiv = MyConnectionClass.aktivoitu
            vc.etunimisukunimi = " \(MyConnectionClass.etunimi) \(MyConnectionClass.sukunimi)"
            vc.puhelin = MyConnectionClass.puhelin
            vc.kuvauslupa = MyConnectionClass.kuvalupa
            vc.kuvaBase64 = MyConnectionClass.image
            self.navigationController?.pushViewController(vc, animated: true)
        }
//        Huomautus
        else
        {
            present(allert, animated: true)
        }
    }
    
}
