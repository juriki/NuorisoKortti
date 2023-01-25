//
//  ConnectionToServer.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 20.1.2023.
//
import SwiftUI
import UIKit
import Foundation

class ConnectionToServer: UIViewController {
    
    public var username: String = ""
    public var password: String = ""
    public var islogged = false
    
    func makeConnection(_userName: String, _password: String)
    {
        let logPas: String = "\(_userName)&password=\(_password)"
        print("Ä********************************")
        print(logPas)
        guard let url = URL(string: "http://192.168.10.197:8888/test/index3.php?login=\(logPas)") else {return}
        
        URLSession.shared.dataTask(with: url){[weak self] (data, response, error) in
            if let error = error
            {
                print(error)
                return
            }
            DispatchQueue.main.async{
                
                guard let data = data else {return}
                do
                {
                    
                    let users = try JSONDecoder().decode(User.self, from: data)
                    self!.username = (users.Kayttajanimi)!
//                    self.password = (users.first?.Salasana)!
//                    let netxScreen = LoginNewViewController()
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
                    let LG = self?.storyboard?.instantiateViewController(withIdentifier:"LoginNewViewController")
                    self?.navigationController?.pushViewController(LG!, animated: true)
                }
            }
        }.resume()
        
    }

}
