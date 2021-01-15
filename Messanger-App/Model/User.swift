//
//  User.swift
//  Messanger-App
//
//  Created by PROGRAMAR on 14/01/21.
//

import Foundation
import Firebase
import  FirebaseFirestoreSwift

struct  User: Codable, Equatable {
    
    var id = ""
    var username: String
    var email : String
    var pushId = ""
    var avatarLink = ""
    var status : String
    
    static var currenId : String{
        return  Auth.auth().currentUser!.uid
        
    }
    
    static var curreUser: User? {
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.data(forKey: KCURRENTUSER){
                let decoder =  JSONDecoder()
                
                do{
                    let object = try decoder.decode(User.self, from: dictionary)
                    return object
                }catch
                {
                    print("Error decoding user from user defaults \(error.localizedDescription)")
                }
                
            }
        }
        return nil
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
}
