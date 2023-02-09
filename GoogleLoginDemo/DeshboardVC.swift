//
//  ViewController.swift
//  GoogleLoginDemo
//
//  Created by Sunil Developer on 07/02/23.
//

import UIKit
import SDWebImage

class DeshboardVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFamilyName: UILabel!
    @IBOutlet weak var lblGivenName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    var name: String?
    var familyName: String?
    var givenName: String?
    var email: String?
    var profileImage: URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.cornerRadius = 60
        getUserData()
    }

    func getUserData() {
        lblName.text = "Full Name: \(name ?? "")"
        lblFamilyName.text = "Family Name: \(familyName ?? "")"
        lblGivenName.text = "Given Name: \(givenName ?? "")"
        lblEmail.text = "Email ID: \(email ?? "")"
        profileImg.sd_setImage(with: profileImage, placeholderImage: UIImage(systemName: "googleImg"))
    }

}

