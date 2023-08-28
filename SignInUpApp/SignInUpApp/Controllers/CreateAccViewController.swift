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
    
    private var isValidEmail = false
    private var isConfPassword = false
 //   private var passwordStrength

    
    
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
           VerificationService.isValidEmail(email: email) {
            isValidEmail = true
        } else {
            isValidEmail = false
             }
        errorEmailLbl.isHidden = isValidEmail
    }
    
    @IBAction func passTFAction(_ sender: UITextField) {
    }
    
    @IBAction func confPassTFAtion(_ sender: UITextField) {
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
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
