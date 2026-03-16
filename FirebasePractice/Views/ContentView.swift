//
//  ContentView.swift
//  FirebasePractice
//
//  Created by Swope, Thomas on 3/9/26.
//

import SwiftUI

struct ContentView: View {
    // Receives the AuthManager that was injected by .environmentObject() in the App struct.
    // SwiftUI re-renders this view whenever auth's @Published properties change.
    @EnvironmentObject var auth: AuthManager

    var body: some View {

        // When auth.user changes (via @Published), SwiftUI re-evaluates this condition
        // and swaps between ProfileView and LoginView automatically.
        if auth.user != nil {
            ProfileView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
