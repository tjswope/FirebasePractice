//
//  FirebasePracticeApp.swift
//  FirebasePractice
//
//  Created by Swope, Thomas on 3/9/26.
//

import SwiftUI
import Firebase

@main
struct FirebasePracticeApp: App {

    // @StateObject subscribes SwiftUI to the AuthManager singleton's @Published changes.
    // Without this, SwiftUI wouldn't know to re-render when auth.user changes.
    @StateObject var auth = AuthManager.shared

    init(){
        // Initializes all Firebase services (Auth, Firestore, etc.)
        // using the config from GoogleService-Info.plist.
        // Must be called before using any Firebase API.
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Injects auth into the view hierarchy so any child view
                // can access it with @EnvironmentObject var auth: AuthManager
                .environmentObject(auth)
        }
    }
}
