//
//  ConnectionClass.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 17.1.2023.
//

//import UIKit
//
//class ConnectionClass{
//
//    func kirjaudusisän(_username: String, _password: String)
//    {
//        guard let url = URL(string: "http://192.168.10.197:8888/test/index3.php?login=\(_username)&\(_password)") else{return}
//        
//        URLSession.shared.dataTask(with: url){ [self]data, response, error in
//
//            guard let data = data else {return}
//
//            do
//            {
//                let users = try JSONDecoder().decode([User].self, from: data)
//                self.username = (users.first?.Kayttajanimi)!
//                self.loggedIn = true
//            }
//            catch
//            {
//                UIAlertAction(title: "ERRO", style: .default)
//                print("******************WRONG PASSWORD *********************")
//                return
//            }
//           
//        }.resume()
//    }
//
//}
