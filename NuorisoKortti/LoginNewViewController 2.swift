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
    let tallennusPaikka = nuoriTallenusPaikka()


    @IBOutlet weak var logintxt: UITextField!
    @IBOutlet weak var NappiKirjaudu: UIButton!
    @IBOutlet weak var passworTxt: UITextField!


    
    
    
    
    
    @IBAction func Login(_ sender: Any) {
        
                    self.MyConnectionClass.getCard(_username: self.logintxt.text!)
    }
        
    
    @IBAction func passwordChanged(_ sender: Any) {
        if(passworTxt.text!.count >= 8 && logintxt.text!.count >= 4)
        {
            NappiKirjaudu.isEnabled = true
//            self.MyConnectionClass.getCard(_username: self.logintxt.text!)
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

    override func viewDidLoad()
    {
        self.navigationController?.isToolbarHidden = true
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = true
        NappiKirjaudu.isEnabled = false
        if(tallennusPaikka.tarkista(key: "Etunimi") != "Error")
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }

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

        if(MyPasswordClass.islogged)
        {
            vc.userAlldata = MyConnectionClass.userAllData
//            Alustetaan Käyttäjän muisti
            tallennusPaikka.poista()
            
//            Tellennetaan tiedot  Käyttäjään muistin
            for userAld in MyConnectionClass.userAllData
            {
                tallennusPaikka.save(key: userAld.key, data: userAld.value)
            }

            self.navigationController?.pushViewController(vc, animated: true)
        }
//        Huomautus
        else
        {
            present(allert, animated: true)
        }
    }
    
}
