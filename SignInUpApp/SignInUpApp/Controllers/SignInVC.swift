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
        didSet {
            errorLbl.isHidden = true
        }
    }
    @IBOutlet weak var signinBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
      private func setupUI() {
            signinBtn.isEnabled = false
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


