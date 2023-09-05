//
//  ProfileVC.swift
//  SignInUpApp
//
//  Created by Valeria Moyseychik on 4.09.23.
//

import UIKit

class ProfileVC: UIViewController {

    @IBAction func deleteAccAction() {
        UserDefaultsService.cleanUserDefaults()
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func logOutAction() { navigationController?.popToRootViewController(animated: true)
    }

}
