//
//  CardViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 21.1.2023.
//

import UIKit

class CardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var StackKorttieView: UIView!
//    @IBOutlet weak var StakkiView: UIStackView!
    @IBOutlet weak var NimiSukunimiLabel: UILabel!
    @IBOutlet weak var NuorisokortiLabe: UILabel!
    @IBOutlet weak var PuhelinLabel: UILabel!
    @IBOutlet weak var TanaanOnLabel: UILabel!
    @IBOutlet weak var SaaOttaKuvaLabel: UILabel!
    @IBOutlet weak var KuvaView: UIImageView!
    
    @IBOutlet weak var NAppi: UIButton!
    let tallennusPaikka = nuoriTallenusPaikka()
    var userAlldata: [String:Any] = [:]
    var nuoriID: Int?
    var kayttajaNimi = ""
    var osoite = "Osoite"
    var etunimisukunimi = "Testi nimi"
    var puhelin = ""
    var kuvaBase64 = ""
    var aktiv: Bool = false
    var kuvauslupa = false
    var imagesourceCode : String?

 
    
    
    
//   Main
    override func viewDidLoad()
    {
        navigationItem.hidesBackButton = true
        NAppi.layer.cornerRadius = 8
//        Lisätän varjo stakkin
        super.viewDidLoad()
        let shadow = StackKorttieView
        shadow?.layer.shadowColor = UIColor.black.cgColor
        shadow?.layer.shadowOpacity = 1
        shadow?.layer.shadowOffset = .zero
        shadow?.layer.shadowRadius = 20
        shadow?.layer.cornerRadius = 10
        shadow?.layer.borderColor = UIColor.black.cgColor
        shadow?.layer.borderWidth = 1

//      Base64 converting to image here
        if(tallennusPaikka.tarkista(key: "Kuva") != "")
        {
            let dataDecoded : Data = Data(base64Encoded: tallennusPaikka.tarkista(key: "Kuva"), options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            KuvaView.image = decodedimage

        }
        self.NimiSukunimiLabel.text = "Nimi : " + tallennusPaikka.tarkista(key: "Etunimi") + " " + tallennusPaikka.tarkista(key: "Sukunimi")
        self.PuhelinLabel.text = "Puhelin numero : " + tallennusPaikka.tarkista(key: "Puhelinnumero")
        let nyt = Date()
        self.nuoriID = Int(tallennusPaikka.tarkista(key: "NuoriID"))
        self.TanaanOnLabel.text = nyt.formatted()
        
        if(tallennusPaikka.tarkista(key: "Kuvauslupa") == "1")
        {
            SaaOttaKuvaLabel.text = "Nuoresta saa otta kuva"
        }else
        {
            SaaOttaKuvaLabel.text = "Nuoresta Ei saa otta kuva"
        }
    }
    
        
    @IBAction func GalleryButton(_ sender: Any) {
                let vc = UIImagePickerController()
                vc.sourceType = .photoLibrary
                vc.delegate = self
                vc.allowsEditing = true
                present(vc, animated: true)
    }

    
////   Kuva lisäys nappi ja tarvittavat funktiot alapulella

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage
        {
//            Haetan kuva galleriasta ja mukkatan se tekstti rivin base64
            KuvaView.image = image
            let imageData = image.jpegData(compressionQuality: 1)
            imagesourceCode = imageData?.base64EncodedString()
//            Tallennetan kuva myös sisäiseen muistin
            tallennusPaikka.vaihdaYksi(key: "Kuva", data: imagesourceCode ?? "")

//            Lähetetään kuva backendin
            guard let url = URL(string: "https://nuorisomobile2023get.azurewebsites.net/api/WorkAssigments?") else {return}
            let parametrs = ["NuoriID": nuoriID as Any,
                             "Etunimi":"juri", "Sukunimi":"juri",
                             "Puhelinnumero":"0451386070",
                             "Osoite":"tieaskolan 3",
                             "Kuva": imagesourceCode ?? "",
                             "Kayttajanimi": "jurijuri"] as [String : Any]

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parametrs,options: []) else {return}
            request.httpBody = httpBody

            let session = URLSession.shared
            session.dataTask(with: request) {(data, response, error) in
                if let response = response{
                    print(response)
                }
                guard let data = data else {return}
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data,options: [])
                    print(json)
                }catch
                {
                    print(error)
                }
            }.resume()

        }
        picker.dismiss(animated: true, completion: nil)
    }

//    jos kuva ei ole valittu niin tämä funktio estä virhe ilmoitusta
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    
}
