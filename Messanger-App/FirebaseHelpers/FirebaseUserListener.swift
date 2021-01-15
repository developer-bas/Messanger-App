//
//  FirebaseUserListener.swift
//  Messanger-App
//
//  Created by PROGRAMAR on 14/01/21.
//

import Foundation
import Firebase

class FirebaseUserListener {
    
    static let shared = FirebaseUserListener()
    
    private init () {}
    
    // MARK: - Login
    
    // MARK: -  Register
    func registerUserWith(email: String, password: String, completion: @escaping (_ error : Error?)-> Void ){
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            
            completion(error)
            
            if error == nil {
                // send verification email
                authDataResult?.user.sendEmailVerification(completion: { (error) in
                    print("Auth email sendt with error \(error?.localizedDescription)")
                })
                // create user and save it
                if authDataResult?.user != nil{
                    let user = User(id: (authDataResult?.user.uid)!, username: email, email: email, pushId: "", avatarLink: "", status: "Hey there Im using")
                    
                    saveUserLocally(user)
                    self.saveUseerToFireStore(user)
                }
            }
        }
    }
    
//    MARK: - Save users
    func saveUseerToFireStore(_ user: User){
        
        do {
            try  FirebaseReference(.User).document(user.id).setData(from: user)
        } catch  {
            print(error.localizedDescription, "addig user")
        }
        
    }
    
}
