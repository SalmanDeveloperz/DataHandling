//
//  dataApp.swift
//  data
//
//  Created by salman on 07/10/2026.
//

//// ModelContext: the object we use to work with SwiftData's stored data.
//// @Enviroment: It gives the View access to the ModelContext that was configured by our model container.
import SwiftUI
import SwiftData

@main
struct dataApp: App {
    var body: some Scene {
        WindowGroup {     // tells what's in app window
            ContentView()
            // later we'll use it for people list shwoing
        
        }
        .modelContainer(for: Person.self)       // Create/configure the SwiftData model storage for the Person model.
        // Person.self ->>> It refers to the Person type, not a particular person object.
    }
}
