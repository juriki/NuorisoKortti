//
//  CardViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 21.1.2023.
//

import UIKit

class CardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var BlockView: UIStackView!
    @IBOutlet weak var StakkiView: UIStackView!
    @IBOutlet weak var NimiSukunimiLabel: UILabel!
    @IBOutlet weak var NuorisokortiLabe: UILabel!
    @IBOutlet weak var PuhelinLabel: UILabel!
    @IBOutlet weak var TanaanOnLabel: UILabel!
    @IBOutlet weak var SaaOttaKuvaLabel: UILabel!
    @IBOutlet weak var KuvaView: UIImageView!

    
    var etunimisukunimi = "Testi nimi"
    var puhelin = ""
    var kuvaBase64 = ""
    var aktiv: Bool = false
    var kuvauslupa = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let shadow = StakkiView
        shadow?.layer.shadowColor = UIColor.black.cgColor
        shadow?.layer.shadowOpacity = 1
        shadow?.layer.shadowOffset = .zero
        shadow?.layer.shadowRadius = 20
        shadow?.layer.cornerRadius = 10
        shadow?.layer.borderColor = UIColor.black.cgColor
        shadow?.layer.borderWidth = 1
//        BlockView.layer.zPosition = 1
        
//      Base64 converting to image here
        if(kuvaBase64 != "")
        {
            let dataDecoded : Data = Data(base64Encoded: kuvaBase64, options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            KuvaView.image = decodedimage
            
        }
        self.NimiSukunimiLabel.text = "\(etunimisukunimi)"
        self.PuhelinLabel.text = "Puhelin : \(puhelin)"
        let nyt = Date()
        self.TanaanOnLabel.text = nyt.formatted()
        if(aktiv)
        {
//            BlockView.layer.zPosition = -5
        }
        if(kuvauslupa == true)
        {
            SaaOttaKuvaLabel.text = "Nuoresta saa otta kuva"
        }else
        {
            SaaOttaKuvaLabel.text = "Nuoresta Ei saa otta kuva"

        }
    }

//   Kuva lisäys nappi ja tarvittavat funktiot alapulella
    @IBAction func GalleryButton(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage
        {
            KuvaView.image = image
//            TODO Täällä muutetan kuva tobase64 ja lehetetään se tietokantaan
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
