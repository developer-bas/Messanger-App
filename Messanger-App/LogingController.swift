//
//  ViewController.swift
//  Messanger-App
//
//  Created by PROGRAMAR on 09/01/21.
//

import UIKit

class LogingController: UIViewController {
    
//    MARK: - Properties
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var passwordLbl: UILabel!
    
    @IBOutlet weak var repeatPasswordLbl: UILabel!
    
    @IBOutlet weak var signupLbl: UILabel!
     
    //    TextField
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    
    @IBOutlet weak var repeatPasswordTxtField: UITextField!
    
//    Buttons
    
    @IBOutlet weak var logingBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var forgotBtn: UIButton!
//    Views
    
    @IBOutlet weak var repeatPasswordView: UIView!
    
    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//MARK: - Actions
    
    @IBAction func logingBtnPressed(_ sender: Any) {
    }
    
    @IBAction func forgotPasswordBtnPressed(_ sender: Any) {
    }
    
    @IBAction func resendEmailBtnPressed(_ sender: Any) {
    }
    @IBAction func signupBtnPressed(_ sender: Any) {
    }
}

