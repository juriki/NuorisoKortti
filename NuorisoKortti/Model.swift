//
//  Model.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 4.1.2023.
//

import Foundation

struct User: Decodable{
    
    let KayttajaId: String?
    let Kayttajanimi: String?
    let Salasana: String?
    let Yllapito: String?
    
}

