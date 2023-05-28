//
//  PasswordViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 25.5.2023.
//

import UIKit
import SwiftUI

class PasswordViewController: UIViewController {
    
    
    @IBOutlet weak var VanhaSalasana: UITextField!
    @IBOutlet weak var UusiSalasana: UITextField!
    @IBOutlet weak var ToistaSalasana: UITextField!
    @IBOutlet weak var NappiSendData: UIButton!
    let tallennusPaikka = nuoriTallenusPaikka()
    
    var vanha = false
    var uusi = false
    var toist = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NappiSendData.isEnabled = false
        NappiSendData.layer.cornerRadius = 10
    }
    
    
    @IBAction func uusiSalasana(_ sender: Any) {
        if(UusiSalasana.text!.count >= 8)
        {
            uusi = true
            enableButton(_vanha: vanha, _uusi: uusi, _toista: toist)
        }
        else
        {
            uusi = false
            NappiSendData.isEnabled = false
        }
    }
    
    
    @IBAction func Vanhasana(_ sender: Any)
    {
        if(VanhaSalasana.text!.count >= 8)
        {
            vanha = true
            enableButton(_vanha: vanha, _uusi: uusi, _toista: toist)
        }else
        {
            vanha = false
            NappiSendData.isEnabled = false
        }
        
    }
    
    @IBAction func ToistaSAlasana(_ sender: Any)
    {
        if(ToistaSalasana.text!.count >= 8)
        {
            toist = true
            enableButton(_vanha: vanha, _uusi: uusi, _toista: toist)
        }else
        {
            toist = false
            NappiSendData.isEnabled = false
        }
        
    }
    
    func enableButton (_vanha: Bool, _uusi: Bool, _toista: Bool)
    {
        if(_vanha && _uusi && _toista)
        {
            NappiSendData.isEnabled = true
        }
    }
    
    @IBAction func SendData(_ sender: Any)
    {
        if(UusiSalasana.text != ToistaSalasana.text)
        {
            NappiSendData.isEnabled = false
            let allert = UIAlertController(title: "Huomio!", message: "Salasanat eivät täsmä", preferredStyle: .alert)
                allert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{action in
                print("dismis")
            }))
            present(allert, animated: true)
            return
            
        }
     
        let userName = tallennusPaikka.tarkista(key: "Kayttajanimi")
        let passWord = VanhaSalasana.text!
        let rePassWord = ToistaSalasana.text
        
        guard let url = URL(string: "https://nuorisomobile2023get.azurewebsites.net/api/employees?") else {return}
        let parametrs = ["Kayttajanimi": userName, "Salasana": passWord, "UusiSalasana": rePassWord ?? ""] as [String : Any]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parametrs,options: []) else {return}
        request.httpBody = httpBody

        let session = URLSession.shared
        session.dataTask(with: request) {(data, response, error) in
            if let response = response{
                print(response)
            }
            guard let data = data else {return}
            do
            {
                let json = try JSONSerialization.jsonObject(with: data,options: [])
                print(json)
            }catch
            {
                print(error)
            }
        }.resume()
        
        
    }

}
