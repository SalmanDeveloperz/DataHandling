//
//  ContentView.swift
//  data
//
//  Created by salman on 07/10/2026.
//

//// ModelContext: the object we use to work with SwiftData's stored data.
//// @Enviroment: It gives the View access to the ModelContext that was configured by our model container.


import SwiftUI
import SwiftData    

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var people: [Person]
    
    var body: some View {
        NavigationStack{
            VStack{
                List(people){person in
                    NavigationLink{
                        PersonDetailView(person : person)
//                        AddPerson()
                    } label: {
                        VStack(alignment: .leading) {
                            Text(person.name)
                            Text(person.gmail)
//                            Text(person.job)
                        }
                    }
                }
                .navigationTitle("People")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        NavigationLink{
                            AddPerson()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}


//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hellooo, world!")
//            
//            Button("Add Person"){
//                let person = Person(
//                    name: "Saluu",
//                    fatherName: "Ramzan Sab",
//                    gmail: "salman.reach@gmail.com",
//                    job: "Being Developer",
//                    age: 22,
//                    height: 5.11
//                    
//                )
//                modelContext.insert(person)
//            }
//        }
//        .padding()
//    }
//}



#Preview {
    ContentView()
    .modelContainer(for: Person.self)
}
