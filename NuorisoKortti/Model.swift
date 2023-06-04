//
//  Model.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 4.1.2023.
//

import Foundation


struct User: Decodable{

    let nuoriId: Int?
    let etunimi: String?
    let sukunimi: String?
    let syntymaAika: String?
    let puhelinnumero: String?
    let osoite: String?
    let huoltaja: Int?
    let sposti: String?
    let allergiat: String?
    let kuvauslupa: Bool
    let aktivointi: Bool
    let kuva: String?
    let kayttajanimi: String?

}

struct useki: Decodable{
    let usek: [User]
}
