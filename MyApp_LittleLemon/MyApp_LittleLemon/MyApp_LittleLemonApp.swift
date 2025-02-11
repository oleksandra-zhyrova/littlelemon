//
//  MyApp_LittleLemonApp.swift
//  MyApp_LittleLemon
//
//  Created by Oleksandra Zhyrova on 05.02.2025.
//

import SwiftUI

@main
struct MyApp_LittleLemonApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
//            let personaInfo = PersonaInfo(firstName: "_firstName",
//                                          email: "_email",
//                                          lastName: "_lastName",
//                                          phoneNumber: "_phoneNumber",
//                                          notificationPreferences: .init(orderStatuses: true,
//                                                                         passwordChanges: true,
//                                                                         specialOffers: true,
//                                                                         newsletter: true))
//            
//            PersonalInformationView(personaInfo: .constant(personaInfo))
            
            AuthorizationView()
        }
    }
}
