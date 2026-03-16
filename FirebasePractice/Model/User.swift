//
//  User.swift
//  FirebasePractice
//
//  Created by Swope, Thomas on 3/10/26.
//

import Foundation
import Combine

// ObservableObject so SwiftUI can react to changes on individual user properties.
// Each @Published property triggers a UI re-render when changed.
class User: ObservableObject{
    @Published var id: String
    @Published var email: String
    @Published var name: String      // Stored in Firestore
    @Published var address: String   // Stored in Firestore

    init(id: String, email: String, name: String = "", address: String = "") {
        self.id = id
        self.email = email
        self.name = name
        self.address = address
    }
}
