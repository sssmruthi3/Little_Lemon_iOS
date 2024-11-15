//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/11/24.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName: String = (UserDefaults.standard.string(forKey: "first name key") ?? "Default First Name");
    let lastName: String =  (UserDefaults.standard.string(forKey: "last name key") ?? "Default Last Name");
    let email: String = (UserDefaults.standard.string(forKey: "email key") ?? "Default Email");
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            HeaderComponent()
            VStack{
                Text("Personal Information")
                Image("Profile")
                Text("First name: \(firstName)")
                Text("Last name: \(lastName)")
                Text("Email: \(email)")
                Spacer()
                
                VStack{
                    Text("Email notifications")
                        .font(.regularText())
                        .foregroundColor(.primaryColor1)
                    VStack {
                        Toggle("Order statuses", isOn: $orderStatuses)
                        Toggle("Password changes", isOn: $passwordChanges)
                        Toggle("Special offers", isOn: $specialOffers)
                        Toggle("Newsletter", isOn: $newsletter)
                    }.padding()
                }.foregroundColor(.primaryColor1)
                
                Spacer()
                Button("Logout") {
                    UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    UserProfile()
}
