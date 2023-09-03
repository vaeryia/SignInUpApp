//
//  WelcomeVC.swift
//  SignInUpApp
//
//  Created by Valeria Moyseychik on 3.09.23.
//

import UIKit

class WelcomeVC: UIViewController {
    
    
    @IBOutlet weak var infoLbl: UILabel!
    var userModel: UserModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func contAction() {
    //TODO: save data
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupUI() {
        infoLbl.text = "\(userModel?.name ?? "") to our cool App"
    }
}
