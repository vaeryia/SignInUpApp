//
//  SignUpVC.swift
//  SignInUpApp
//
//  Created by Valeria Moyseychik on 24.08.23.
//

import UIKit

class SignUpVC: UIViewController {
    
   // email
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var errorEmailLbl: UILabel!
    // name
    @IBOutlet weak var nameTF: UITextField!
    // password
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorPassLbl: UILabel!
//доделать, не подвязываются вьюхи
        //  @IBOutlet var strongPasswordIndicatorsViews: [UIView]!
    @IBOutlet weak var confirmPassTF: UITextField!
    @IBOutlet weak var errorConfirmPassLbl: UILabel!
    // cont button
    @IBOutlet weak var continueBtn: UIButton!
    // scroll view
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //strongPasswordIndicatorsViews.forEach { view in view.alpha = 0.2    }
        
        startKeyboardObserver ()
    }
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func keyboardWillShow () {
        print("keyboardWillShow")
    }
   
    @objc private func keyboardWillHide () {
        print("keyboardWillHide")
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
