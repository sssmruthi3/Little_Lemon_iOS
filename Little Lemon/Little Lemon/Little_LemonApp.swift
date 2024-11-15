//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 10/26/24.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
