//
//  ViewController.swift
//  GoogleLoginDemo
//
//  Created by Sunil Developer on 07/02/23.
//

import UIKit
import GoogleSignIn


enum LoginVCValidation: String {
    case email = "Please enter email"
    case password = "Please enter password"
    case vaildEmail = "Please entet vaide Email"
}

class LoginVC: UIViewController {
    
    @IBOutlet weak var buttomView: UIView!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginInitialSetUp()
        lblEmail.isHidden = true
        lblPassword.isHidden = true
        
    }
    
    @IBAction func onClickTxtEmail(_ sender: Any) {
        lblEmail.isHidden = false
    }
    
    
    
    @IBAction func onClickTxtPassword(_ sender: Any) {
        lblPassword.isHidden = false
    }
    
    
    
    @IBAction func onClickSigiInBtn(_ sender: Any) {
        
        
        let validation = doValidation()
        if validation.0 {
            pushToDeshboardVC()
        }else {
            showAlert(title: "Error", message: validation.1, hendler: nil)
        }
    }
    
    @IBAction func onClickGoogleBtn(_ sender: Any) {
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            
            GIDSignIn.sharedInstance.signIn(with: GIDConfiguration(clientID: "686270062191-bs7ovc43o4uq01p1v9qkmj9aa7cbvmo3.apps.googleusercontent.com"), presenting: self) { (userInfo, error) in
                print(userInfo?.profile?.name)
                print(userInfo?.profile?.familyName)
                print(userInfo?.profile?.givenName)
                print(userInfo?.profile?.email)
                print(userInfo?.profile?.imageURL(withDimension: 250))
                print(userInfo?.profile?.hasImage)
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DeshboardVC") as! DeshboardVC
            
                vc.name = userInfo?.profile?.name
                vc.familyName = userInfo?.profile?.familyName
                vc.givenName = userInfo?.profile?.givenName
                vc.email = userInfo?.profile?.email
                vc.profileImage = userInfo?.profile?.imageURL(withDimension: 250)
            self.navigationController?.pushViewController(vc, animated: true)
                
                
            }
        } else {
            GIDSignIn.sharedInstance.signIn(with: GIDConfiguration(clientID: "686270062191-bs7ovc43o4uq01p1v9qkmj9aa7cbvmo3.apps.googleusercontent.com"), presenting: self) { (userInfo, error) in
                print(userInfo?.profile?.name)
                print(userInfo?.profile?.familyName)
                print(userInfo?.profile?.givenName)
                print(userInfo?.profile?.email)
                print(userInfo?.profile?.imageURL(withDimension: 250))
                print(userInfo?.profile?.hasImage)
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DeshboardVC") as! DeshboardVC
                vc.name = userInfo?.profile?.name
                vc.familyName = userInfo?.profile?.familyName
                vc.givenName = userInfo?.profile?.givenName
                vc.email = userInfo?.profile?.email
                vc.profileImage = userInfo?.profile?.imageURL(withDimension: 250)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    @IBAction func onClickFacebookBtn(_ sender: Any) {
    }
    
}
//MARK:- Custom FUnction
extension LoginVC {
    
    func doValidation() -> (Bool, String) {
        if (txtEmail.text?.isEmpty ?? false) {
            return(false, LoginVCValidation.email.rawValue)
            
        } else if (txtPassword.text?.isEmpty ?? false) {
            return(false, LoginVCValidation.password.rawValue)
        }
        return(true, "")
    }
    
    func pushToDeshboardVC() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DeshboardVC") as! DeshboardVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func loginInitialSetUp() {
        
        buttomView.clipsToBounds = true
        buttomView.layer.cornerRadius = 40
        buttomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        btnSignIn.clipsToBounds = true
        btnSignIn.layer.cornerRadius = 20
        
        
        
    }
    
}

