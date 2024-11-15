//
//  Home.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/11/24.
//

import SwiftUI

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu().tabItem(){
                Label("Locations", systemImage: "list.dash")
            }.environment(\.managedObjectContext, persistence.container.viewContext)
            UserProfile().tabItem(){
                Label("Profile", systemImage: "square.and.pencil")
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
