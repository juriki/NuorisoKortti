//
//  Model2.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 9.1.2023.
//

import Foundation

struct User2: Decodable{
    
    let NuoriId: String?
    let Etunimi: String?
    let Sukunimi: String?
    let SyntymaAika: String?
    let Puhelinnumero: String?
    let Osoite: String?
    let Postinumero: String?
    let Huoltaja: String?
    let SPosti: String?
    let Allergiat: String?
    let Aktivointi: String?
    let Kayttajanimi: String?
}


//NuoriId": "1001"
//, "Etunimi": "Juri"
//, "Sukunimi": "T\u00f6kvin"
//, "SyntymaAika": "03.11.1982",
//"Puhelinnumero": "0451386070",
//"Osoite": "Pelimannintie 13 b 353",
//"Postinumero": "00420",
//"Huoltaja": "1001",
//"SPosti": "juritokvin@Gmail.com",
//"Allergiat": "Ei ole", "Kuvauslupa": "0",
//"Aktivointi": "1", "Kuva": "",
//"Kayttajanimi": "juritokvin"
