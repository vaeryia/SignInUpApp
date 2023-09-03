//
//  CreateAccViewController.swift
//  SignInUpApp
//
//  Created by Valeria Moyseychik on 28.08.23.
//

import UIKit

class CreateAccViewController: UIViewController {
//email
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var errorEmailLbl: UILabel!
//name
    @IBOutlet weak var nameTF: UITextField!
//password
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorPassLbl: UILabel!
//strongPasswordIndicatoes
    @IBOutlet var strongPasswordIndicatoesViews: [UIView]!
//confPass
    @IBOutlet weak var confirmPassTF2: UITextField!
    @IBOutlet weak var errorConPassLbl: UILabel!
 //continueBtn
    @IBOutlet weak var continueBtn: UIButton!
//scrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var isValidEmail = false { didSet { updateContBtnState() }}
    private var isConfPassword = false { didSet { updateContBtnState() }}
    private var passwordStrength: PasswordStrength = .veryWeak { didSet { updateContBtnState() }}

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strongPasswordIndicatoesViews.forEach {
            view in view.alpha = 0.15
        }
        startKeyboardObserver()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func emailTFAction(_ sender: UITextField) {
        if let email = sender.text,
           !email.isEmpty,
           VerificationService.isValidEmail(email: email)
        {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        errorEmailLbl.isHidden = isValidEmail
    }
    
    @IBAction func passTFAction(_ sender: UITextField) {
        if let passText = sender.text,
           !passText.isEmpty
        {
            passwordStrength = VerificationService.isValidPassword(pass: passText)
        } else {
            passwordStrength = .veryWeak
        }
        errorPassLbl.isHidden = passwordStrength != .veryWeak
        setupStrognIndicatorsViews()
    }
    
    @IBAction func confPassTFAtion(_ sender: UITextField) {
        if let confPassText = sender.text,
           !confPassText.isEmpty,
           let passText = passwordTF.text,
           !passText.isEmpty
        {
            isConfPassword = VerificationService.isPassConfirm(pass1: passText, pass2: confPassText)
        } else {
            isConfPassword = false
        }
        errorConPassLbl.isHidden = isConfPassword
    }
    
    @IBAction func signInAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func contAction() {
        if let email = emailTF.text,
           let pass = passwordTF.text {
            let userModel = UserModel(name: nameTF.text, email: email, pass: pass)
performSegue(withIdentifier: "goToVerification", sender: userModel)        }
    }
    
    private func setupStrognIndicatorsViews() {
        for (index, view) in strongPasswordIndicatoesViews.enumerated() {
            if index <= (passwordStrength.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.2
            }
        }
//
//        strongPasswordIndicatoesViews.enumerated().forEach {index, view in
//
//        }
    }
    
    private func updateContBtnState() {
        continueBtn.isEnabled = isValidEmail && isConfPassword && passwordStrength != .veryWeak
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
   //MARK: - Navigation

 
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let desinationVC = segue.destination as? VerificationsVC, let userModel = sender as? UserModel else { return }
        desinationVC.userModel = userModel
    }
   

}
