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
    
    var nuoriId: Int?
    var etunimi = ""
    var sukunimi = ""
    var kayttajanimi = ""
    var puhelin = ""
    var voimassa = false
    var image = ""
    var kuvalupa: Bool = false
    var aktivoitu: Bool = false
    var userAllData: [String:Any] = [:]

    
    func makeConnection(_userName: String, _password: String)
    {
        guard let url = URL(string: "https://nuorisomobile2023get.azurewebsites.net/api/employees?\(_userName)/\(_password)") else {return}
        URLSession.shared.dataTask(with: url){[weak self] (data, response, error) in
            if error != nil
            {return}
            DispatchQueue.main.async{ [self] in
                guard let data = data else {return}
                do
                {
                    if(data.count > 2)
                    {
                        let users = try JSONDecoder().decode([UserLogin].self, from: data)
                        self!.username = (users.first?.kayttajanimi)!
                        self!.islogged = true
                        self!.password = ""
                        self!.islogged = true
                    }
                    else
                    {
                        self!.username = ""
                        self!.islogged = false
                        self!.password = "Tarkista Salasana"
                        
                    }
                }
                catch
                {
                    self!.islogged = false
                    self!.voimassa = false
                    self!.password = "Tarkista Salasana"
                }
            }
        }.resume()
    }
    
    
    
    
    
    func getCard(_username: String)
    {
        guard let url = URL(string: "https://nuorisomobile2023get.azurewebsites.net/api/WorkAssigments?\(_username)") else {return}

        URLSession.shared.dataTask(with: url){[self]data, response, error in
           if error != nil{return}
            guard let data = data else {return}
            do
            {
                let decode = JSONDecoder()
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "YYYY-MM-dd"
                decode.dateDecodingStrategy = .formatted(dateFormater)
                let users = try JSONDecoder().decode([User].self, from: data)
                print(users.first?.kayttajanimi ??  "")
                if(data.count > 5)
                {
                    self.nuoriId = (users.first?.nuoriId)!
                    self.etunimi = (users.first?.etunimi)!
                    self.sukunimi = (users.first?.sukunimi)!
                    self.puhelin = (users.first?.puhelinnumero)!
                    self.voimassa = (users.first?.aktivointi)!
                    self.aktivoitu  = (users.first?.aktivointi)!
                    self.kuvalupa = (users.first?.kuvauslupa)!
                    self.image = (users.first?.kuva ?? "")
                    self.kayttajanimi = (users.first?.kayttajanimi)!
                    self.aktivoitu = true
//     jos vaihdat joku avaimesta niin on myös vaihdettava nuoriTallenusPaikka luokassa
                    userAllData = ["NuoriID": self.nuoriId as Any,
                                     "Etunimi":self.etunimi,
                                     "Sukunimi": self.sukunimi,
                                     "SyntymäAika": users.first?.syntymaAika ?? "",
                                     "Puhelinnumero": self.puhelin,
                                     "Osoite": users.first?.osoite ??  "",
                                     "Huoltaja": users.first?.huoltaja ?? 0,
                                     "Sähköposti": users.first?.sposti ?? "",
                                     "Allergiat": users.first?.allergiat ?? "",
                                     "Kuvauslupa": users.first?.kuvauslupa ?? false,
                                     "Aktivoitu": self.aktivoitu,
                                     "Kuva": self.image,
                                     "Kayttajanimi": self.kayttajanimi,
                                     ] as [String : Any]
                    
                
                }else
                {
                    self.aktivoitu = false
                    self.islogged = false
                    self.username = "Tarkista Käyttäjänimi"
                    return
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
    
    
    
    
    func updateUserData(completion: @escaping(_ String: Any)-> Void, username: String, key : String)
    {
        let urlshare = "https://nuorisomobile2023get.azurewebsites.net/api/WorkAssigments?\(username)"
        
        let url = URL(string: urlshare)!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let data else { return }
            if let userNewData = try? JSONDecoder().decode([User].self, from: data)
            {
                switch key {
                case "kuva":
                    completion(userNewData[0].kuva ?? "")
                    return
                    
                case "aktivointi":
                    completion(userNewData[0].aktivointi)
                    return
                default:
                    print("Worng CASE")
                }
            }else
            {
                print("error")
            }
        }.resume()

        
    }
}
    

