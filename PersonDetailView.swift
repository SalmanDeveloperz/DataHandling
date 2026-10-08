//
//  PersonDetailView.swift
//  data
//
//  Created by salman on 08/10/2026.
//


import SwiftUI
//import UIKit

struct PersonDetailView: View {
    let person: Person
    var body: some View{
        if let dp = person.dp,
           let image = UIImage(data: dp){
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
//                    .frame(alignment: .init(horizontal: .center, vertical: .center))
        }
        
        Form{
            
            Text("Name: \(person.name)")
            Text("Father Name: \(person.fatherName)")
            Text("Gmail: \(person.gmail)")
            Text("Job: \(person.job)")
            Text("Age: \(person.age)")
            Text("Height: \(person.height)")
            
        }
        .navigationTitle("Hey \(person.name)")
    }
}
