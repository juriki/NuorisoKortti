//
//  Model3.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 24.3.2023.
//

import Foundation


struct UserLogin: Decodable{
    
    let kayttajaId: Int?
    let kayttajanimi: String?
    let salasana: String?
    let yllapito: Bool
    
}

