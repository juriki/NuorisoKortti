//
//  SecondCarViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 20.5.2023.
//

import UIKit

class SecondCarViewController: UIViewController {

    @IBOutlet weak var Nimi: UILabel!
    var nimi = "Pizda";
    
//    func readFromFile()
//    {
//       if let path = Bundle.main.path(forResource: "kayttajaTiedot", ofType: "txt"){
//           if  let myText = try? String(contentsOfFile: path){
//               Nimi.text = myText
//           }
//       }
//    }
//
    func gedDocumentsDirectory() -> URL
    {
        let path = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
        return path[0]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let myUrl = gedDocumentsDirectory().appendingPathComponent("kayttajaTiedot.txt")
        do
        {
            let text = "HELLO "
            try text.write(to: myUrl, atomically: true, encoding: String.Encoding(rawValue: NSUTF8StringEncoding))
            let input = try String(contentsOf: myUrl)
            print(input)
        }catch
        {
            print(error)
        }
        var array = ["NuoriID": 21345 as Any, "Etunimi":"juri", "Sukunimi":"juri", "Puhelinnumero":"0451386070", "Osoite":"tieaskolan 3","Kuva": "aaa","Kayttajanimi": "jurijuri"] as [String : Any]
        
        func json(from object:Any) -> String? {
            guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
                return nil
            }
            return String(data: data, encoding: String.Encoding.utf8)
        }

        print("\(json(from:array as Any) ?? "")")

    }
    


}
