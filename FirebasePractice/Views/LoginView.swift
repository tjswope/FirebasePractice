//
//  LoginView.swift
//  FirebasePractice
//
//  Created by Swope, Thomas on 3/9/26.
//

import SwiftUI

struct LoginView: View {

    // @State manages local, view-owned data. These are just for the text fields —
    // they don't need to be shared with other views like @Published properties do.
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack{
            // $ creates a two-way binding: the TextField reads AND writes to email
            TextField("Email", text: $email)
                .padding()

            SecureField("Password", text: $password)
                .padding()

            Button("Login"){
                // Task creates an async context so we can call async functions from a button action.
                // The signIn call goes to Firebase servers, so it must be async.
                Task{
                    await AuthManager.shared.signIn(email: email, password: password)
                }
            }.padding()

            Button("Sign up"){
                Task{
                    await AuthManager.shared.signUp(email: email, password: password)
                }
            }.padding()

            Button("Sign out"){
                Task{
                    // signOut is not async (it only clears local state), but
                    // we access it through the singleton the same way.
                    AuthManager.shared.signOut()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
