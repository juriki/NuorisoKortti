//
//  ConnectionToServer.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 20.1.2023.
//
import SwiftUI
import UIKit
import Foundation

class ConnectionToServer: UIViewController
{
    
    public var username: String = ""
    public var password: String = ""
    public var islogged = false
    
//    var username = ""
    var etunimi = ""
    var sukunimi = ""
    var puhelin = ""
    var voimassa = ""
    var image = ""
    var aktivoitu: Bool = false
    
    func makeConnection(_userName: String, _password: String)
    {
        let logPas: String = "\(_userName)&password=\(_password)"
        guard let url = URL(string: "http://192.168.10.197:8888/test/index3.php?login=\(logPas)") else {return}
        URLSession.shared.dataTask(with: url){[weak self] (data, response, error) in
            if let error = error
            {return}
            DispatchQueue.main.async{
                guard let data = data else {return}
                do
                {
                    let users = try JSONDecoder().decode(User.self, from: data)
                    self!.username = (users.Kayttajanimi)!
//                    self.password = (users.first?.Salasana)!
//                    let netxScreen = LoginNewViewController()'

                    DispatchQueue.main.async
                    {
                        if(self!.username == "")
                        {
                            let LG = self!.storyboard?.instantiateViewController(withIdentifier:"LoginNewViewController")
                            self?.navigationController?.pushViewController(LG!, animated: true)
                        }
                        self!.islogged = true
                    }
                }
                catch
                {
                    DispatchQueue.main.async
                    {
                        let LG = self?.storyboard?.instantiateViewController(withIdentifier:"LoginNewViewController")
                        self?.navigationController?.pushViewController(LG!, animated: true)
                    }
                }
            }
        }.resume()
    }
    
    func getCard(_username: String)
    {
        guard let url = URL(string: "http://192.168.10.197:8888/test/index4.php?login=\(_username)") else {return}
        
        URLSession.shared.dataTask(with: url){data, response, error in
            if error != nil{return}
            guard let data = data else {return}
            do
            {
                let users = try JSONDecoder().decode(User2.self, from: data)
                self.etunimi = (users.Etunimi)!
                self.sukunimi = (users.Sukunimi)!
                self.puhelin = (users.Puhelinnumero)!
                self.voimassa = (users.Aktivointi)!
                self.voimassa = (users.Aktivointi)!
//  Funkito DispatchQueue.main.async anna päivittä tiedot näyttöllä
                if(self.voimassa == "1")
                {
                    self.aktivoitu = true
                }
            }
            catch
            {
                    let LG = self.storyboard?.instantiateViewController(withIdentifier:"LoginNewViewController")
                    self.navigationController?.pushViewController(LG!, animated: false)
            }
        }.resume()
    }
}
    

