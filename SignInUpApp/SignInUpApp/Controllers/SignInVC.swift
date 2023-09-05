//
//  SignInVC.swift
//  SignInUpApp
//
//  Created by Valeria Moyseychik on 23.08.23.
//

import UIKit

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLbl: UILabel! {
        didSet { errorLbl.isHidden = true }
    }
    @IBOutlet weak var signinBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if let _ = UserDefaultsService.getUserModel() {
            goToTabBarController()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        emailTF.text = ""
        passwordTF.text = ""
    }
    
    
    
    @IBAction func signInAction() {
        errorLbl.isHidden = true
        guard let email = emailTF.text,
        let password = passwordTF.text,
        let userModel = UserDefaultsService.getUserModel(),
        email == userModel.email,
        password == userModel.pass
        else {
            errorLbl.isHidden = false
            return }
        
        goToTabBarController()
    }
    
    private func setupUI() {
//        signinBtn.isEnabled = false
    }
    
    private func goToTabBarController() {
        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SignInVC {
    
}
