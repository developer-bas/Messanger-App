//
//  ViewController.swift
//  Messanger-App
//
//  Created by PROGRAMAR on 09/01/21.
//

import UIKit
import ProgressHUD


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
    
    var isLogin : Bool = true
    
    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIFor(login: true)
        setupTextFieldDelegate()
        setupBackgroundTap()
    }
    
//MARK: - Actions
    
    @IBAction func logingBtnPressed(_ sender: Any) {
        
        if isDataInputedFor(type: isLogin ? "login" : "registration"){
//            Loging
        }else {
            ProgressHUD.showFailed("All fields are required")
        }
        
    }
    
    @IBAction func forgotPasswordBtnPressed(_ sender: Any) {
        if isDataInputedFor(type: "password"){
//            reset pasword
        }else {
            
            ProgressHUD.showFailed("Email is required.")
        }
    }
    
    @IBAction func resendEmailBtnPressed(_ sender: Any) {
        if isDataInputedFor(type: "password"){
//            resend  passwprd
        }else {
            ProgressHUD.showFailed("Email is required.")
        }
        
    }
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        updateUIFor(login: sender.titleLabel?.text == "Login")
        isLogin.toggle()
    }
    
    //MARK: - Setup
    private func setupTextFieldDelegate(){
        emailTxtField.addTarget(self, action: #selector(textDidChange(_ :)), for: .editingChanged)
        passwordTxtField.addTarget(self, action: #selector(textDidChange(_ :)), for: .editingChanged)
        repeatPasswordTxtField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textDidChange(_ textField: UITextField){
        
        updatePlaceHolderLabel(textField: textField)
    }
    
    private func setupBackgroundTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func backgroundTap(){
        view.endEditing(false)
    }
    
//    MARK: - ANimations
    
    private func updateUIFor(login: Bool){
        let image = UIImage(named: login ? "loginBtn" : "registerBtn")
        
        logingBtn.setImage(image, for: .normal)
        
        signupBtn.setTitle(login ? "Sign up ": "Login", for: .normal)
        signupLbl.text = login ? "Don't have an account?" : "Have an account?"
        
        UIView.animate(withDuration: 0.5) {
            self.repeatPasswordTxtField.isHidden = login
            self.repeatPasswordLbl.isHidden = login
            self.repeatPasswordView.isHidden = login
        }
    
    }
    
    
    private func updatePlaceHolderLabel(textField: UITextField){
        switch textField {
        case emailTxtField:
            emailLbl.text  = textField.hasText ? "Email" : ""
        case passwordTxtField:
            passwordLbl.text = textField.hasText ? "Password" : ""
        case repeatPasswordTxtField:
            repeatPasswordLbl.text = textField.hasText ? "Repear password" : ""
        default:
            print("")
        }
    }
    
    
//    MARK: - Helpers
    private func isDataInputedFor(type: String)->Bool {
        switch type {
        case "login":
            return emailTxtField.text != "" && passwordTxtField.text != ""
        case "registration":
            return emailTxtField.text != "" && passwordTxtField.text != "" && repeatPasswordTxtField.text != ""
        default:
            return emailTxtField.text != ""
        }
    }
}

