//
//  Person.swift
//  data
//
//  Created by salman on 07/10/2026.
//

import SwiftUI
import SwiftData

@Model
final class Person{         // hmara data
    var name: String
    var fatherName: String
    var gmail: String
    var job: String
    var age: Int
    var height: Float
    var dp: Data?
    
    init(
        name: String,
        fatherName:String,
        gmail: String,
        job: String,
        age: Int,
        height: Float,
        dp: Data? = nil
    ){
        self.name = name
        self.fatherName = fatherName
        self.gmail = gmail
        self.job = job
        self.age = age
        self.height = height
        self.dp = dp
        // object's stored property = value passed to the initializer
    }
    
    
}





