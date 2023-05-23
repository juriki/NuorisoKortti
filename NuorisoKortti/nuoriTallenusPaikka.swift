//
//  nuoriTallenusPaikka.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 23.5.2023.
//

import SwiftUI
import UIKit
import Foundation
import CryptoKit

class nuoriTallenusPaikka: UIViewController
{
 
//    Jos vaihdat jotain avianta niin on vaihdettava myös  Connection to server luokassa getCard() functiossa
    let keys = ["NuoriID","Etunimi","Sukunimi","SyntymäAika","Puhelinnumero","Osoite","Huoltaja","Sähköposti","Allergiat","Kuvauslupa","Aktivoitu","Kuva","Kayttajanimi"]
    
    @State private var storedData = ""
    
    func save(key: String, data: Any)
    {
        UserDefaults.standard.set(data, forKey: key)
        print("Tallennetan" + key, " Value " )
    }
    
//    tarkistus funkito
    
    func tarkista(key: String)-> String
    {
        //    Täällä tarkistetaan onko käyäjä jo laiten muistissa
        guard let myData = UserDefaults.standard.string(forKey: key) else { return "Error" }
        return myData
    }
    
    func vaihdaYksi(key: String, data: String)
    {
        guard let myData = UserDefaults.standard.string(forKey: key) else {return}
        
        if(myData != data)
        {
            UserDefaults.standard.removeObject(forKey: key)
            print("Tiedot " + key + " Poistettu")
            UserDefaults.standard.set(data, forKey: key)
            print("Tallennetan" + key, " Value " )
        }else
        {
            print("Mitään ei ole vaihdettu")
        }

        }
    
    func poista()
        {
        for key in keys
            {
                UserDefaults.standard.removeObject(forKey: key)
                print("Tiedot " + key + " Poistettu")
            
            }
        }

    
}
