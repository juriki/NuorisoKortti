//
//  ConnectionToServer.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 20.1.2023.
//
import SwiftUI
import UIKit
import Foundation
import CryptoKit

class ConnectionToServer: UIViewController
{
    
    public var username: String = ""
    public var password: String = ""
    public var islogged = false
    
    var etunimi = ""
    var sukunimi = ""
    var kayttajanimi = ""
    var puhelin = ""
    var voimassa = false
    var image = ""
    var kuvalupa: Bool = false
    var aktivoitu: Bool = false
    
    func makeConnection(_userName: String, _password: String)
    {
        let myTestUser = _userName
        guard let url = URL(string: "https://nuorisomobile2023get.azurewebsites.net/api/employees?\(myTestUser)/\(_password)") else {return}
        URLSession.shared.dataTask(with: url){[weak self] (data, response, error) in
            if error != nil
            {return}
            DispatchQueue.main.async{ [self] in
                guard let data = data else {return}
                do
                {
                    if(data.count > 2){
                        let users = try JSONDecoder().decode([UserLogin].self, from: data)
                        self!.username = (users.first?.kayttajanimi)!
                        self!.islogged = true
                        self!.password = ""

                        DispatchQueue.main.async
                        {
                            self!.islogged = true
                        }
                    }
                    else
                    {
                        self!.username = ""
                        self!.islogged = false
                        self!.password = ""
                    }
                }
                catch
                {
                    self!.islogged = false
                    self!.etunimi = ""
                    self!.sukunimi = ""
                    self!.puhelin = ""
                    self!.voimassa = false
                    self!.kuvalupa = false
                    self!.username = ""
                    self!.password = "Tarkista Salasana"
                    print(error)
                }
            }
        }.resume()
    }
//    juriatokvina
    func getCard(_username: String)
    {
        guard let url = URL(string: "https://nuorisomobile2023get.azurewebsites.net/api/WorkAssigments?\(_username)") else {return}
        
        URLSession.shared.dataTask(with: url){[self]data, response, error in
           if error != nil{return}
            guard let data = data else {return}
            do
            {
//                2007-03-02T00:00:0
                let decode = JSONDecoder()
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "YYYY-MM-dd"
                
                decode.dateDecodingStrategy = .formatted(dateFormater)
                let users = try JSONDecoder().decode([User].self, from: data)
                if(data.count > 5)
                {
                    self.etunimi = (users.first?.etunimi)!
                    self.sukunimi = (users.first?.sukunimi)!
                    self.puhelin = (users.first?.puhelinnumero)!
                    self.voimassa = (users.first?.aktivointi)!
                    self.aktivoitu  = (users.first?.aktivointi)!
                    self.kuvalupa = (users.first?.kuvauslupa)!
//                    ?? default value
                    self.image = (users.first?.kuva ?? "")
                    self.kayttajanimi = (users.first?.kayttajanimi)!
                    self.aktivoitu = true
                }else
                {
                    self.aktivoitu = false
                    self.islogged = false
                    self.username = "Tarkista Käyttäjänimi"
                }
//  Funkito DispatchQueue.main.async anna päivittä tiedot näyttöllä
                if(self.voimassa == true)
                {
                    self.aktivoitu = true
                }
            }
            catch
            {
//                todo
                self.islogged = false
                self.etunimi = ""
                self.sukunimi = ""
                self.puhelin = ""
                self.voimassa = false
                self.kuvalupa = false
                self.username = ""
                self.username = "Tarkista Käyttäjänimi"
                self.aktivoitu = false
            }
        }.resume()
    }
}
    

