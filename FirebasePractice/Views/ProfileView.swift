//
//  ProfileView.swift
//  FirebasePractice
//
//  Created by Swope, Thomas on 3/16/26.
//

import SwiftUI

struct ProfileView: View {
    // Same @EnvironmentObject pattern — receives the shared AuthManager from the view hierarchy
    @EnvironmentObject var auth: AuthManager

    // Local @State for the text fields. We copy Firestore data into these on load
    // and copy them back to the User object on save.
    @State var name = ""
    @State var address = ""

    var body: some View {
        VStack{
            Text(auth.user?.email ?? "")
                .padding()

            TextField("Name", text: $name)
                .padding()

            TextField("Address", text: $address)
                .padding()

            Button("Save"){
                Task{
                    if let user = auth.user {
                        // Update the User object with the current text field values,
                        // then write them to Firestore
                        user.name = name
                        user.address = address
                        await FirestoreManager.shared.saveUser(user: user)
                    }
                }
            }.padding()

            Button("Sign Out"){
                AuthManager.shared.signOut()
            }.padding()
        }
        // .task runs an async block when the view first appears.
        // This automatically fetches the user's data from Firestore on login,
        // similar to how a Button's Task{} block works but triggered by view appearance.
        .task {
            if let user = auth.user {
                await FirestoreManager.shared.fetchUser(user: user)
                // Copy fetched data into local @State so the text fields show it
                name = user.name
                address = user.address
            }
        }
    }
}

#Preview {
    ProfileView()
}
