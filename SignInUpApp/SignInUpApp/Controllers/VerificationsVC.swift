//
//  VerificationsVC.swift
//  SignInUpApp
//
//  Created by Valeria Moyseychik on 3.09.23.
//

import UIKit

class VerificationsVC: UIViewController {
    
    var  userModel: UserModel?
    
    let randomInt = Int.random(in: 100000 ... 999999)
    var sleepTime = 3
    
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var errorCodeLbl: UILabel!
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startKeyboardObserver()
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func codeTFAction(_ sender: UITextField) {
        errorCodeLbl.isHidden = true
        guard let text = sender.text, !text.isEmpty, text == randomInt.description else {
            errorCodeLbl.isHidden = false
            sender.isUserInteractionEnabled = false
            errorCodeLbl.text = "Error code. Please wait \(sleepTime) seconds"
            let dispatchAfter = DispatchTimeInterval.seconds(sleepTime)
            let deadline = DispatchTime.now() + dispatchAfter
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                sender.isUserInteractionEnabled = true
                self.errorCodeLbl.isHidden = true
                self.sleepTime *= 2
            }
                                          
                            
            return
        }
        performSegue(withIdentifier: "goToWelcomeScreen", sender: nil)
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
  centerYConstraint.constant -= keyboardSize.height / 2
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
     centerYConstraint.constant += keyboardSize.height / 2
    }
    
    private func setupUI() {
        infoLbl.text = "Please enter your code '\(randomInt)' from \(userModel?.email ?? "")"
    }

    //MARK: - Navigation

  
      override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
         guard let desinationVC = segue.destination as? WelcomeVC else { return }
         desinationVC.userModel = userModel
     }

}
