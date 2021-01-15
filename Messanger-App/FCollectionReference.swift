//
//  FCollectionReference.swift
//  Messanger-App
//
//  Created by PROGRAMAR on 14/01/21.
//

import Foundation
import FirebaseFirestore

enum FCollectionsReference : String {
    case User
    case Recent
    
}


func FirebaseReference(_ collectionReference: FCollectionsReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
