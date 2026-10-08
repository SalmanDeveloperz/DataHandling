//
//  AddPerson.swift
//  data
//
//  Created by salman on 08/10/2026.
//

import SwiftUI
import PhotosUI
import SwiftData


struct AddPerson: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""        // @State stores local View state
    @State private var fatherName =  ""
    @State private var address = ""
    @State private var job = ""
    @State private var gmail = ""
    @State private var age = ""
    @State private var height = ""
    
    @State private var selectImage: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    @State private var imageData: Data?
    
    @State private var showPicker = false
    
    @State private var showSuccessAlert = false     // for showing the success message when clicking on the "Save" button
    
    
    
    var body: some View {
        
        Button{
            showPicker = true
        } label: {
            if let selectedImage{
                selectedImage
                    .resizable()
                    .scaledToFill()
            }else{
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.blue)
            }
            
        }
        
        .frame(width:100 , height: 100)
        .clipShape(Circle())
        
        .photosPicker(
            isPresented : $showPicker,
            selection: $selectImage,
            matching: .images
        )
        
        .onChange(of: selectImage){
            Task{
                if let data = try? await selectImage?.loadTransferable(type: Data.self),
                   let uiImage =  UIImage(data: data){
                    
                    imageData = data
                    selectedImage = Image (uiImage: uiImage)
                }
            }
        }
        
        //        VStack {
        //        PhotosPicker(selection: $selectImage, matching: .images) {
        //
        //                if let dp = dp,
        //                   let uiImage = UIImage(data: dp) {
        //
        //                    Image(uiImage: uiImage)
        //                        .resizable()
        //                        .scaledToFill()
        //                } else {
        //                    Image(systemName: "person.circle.fill")
        //                        .resizable()
        //                        .scaledToFit()
        //                        .foregroundStyle(.gray)
        //                }
        //            }
        //            .frame(width: 100, height: 100)
        //            .foregroundColor(.primary)
        //            .clipShape(Circle())
        //            .onChange(of: selectImage) {
        //                Task {
        //                    if let data = try? await selectImage?.loadTransferable(type: Data.self) {
        //                        dp = data
        //                    }
        //                }
        //            }
        
        //        }
        //        .foregroundColor(.red)
        
        Form {
            //   $:  Give the TextField a binding to the name state.
            //   creates a binding so another View control can read/write that state.
            
            TextField("Name", text: $name)
            
            TextField("Father Name", text: $fatherName)
            
            TextField("Job", text: $job)
            
            TextField("Gmail", text: $gmail)
            
            TextField("Age", text: $age)
                .keyboardType(.numberPad)
            
            TextField("Height", text: $height)
                .keyboardType(.decimalPad)
            
        }
        .scrollContentBackground(.hidden)
        .background(Color(.white))
        
        HStack{
            Spacer()
            Button ("Save"){
                let person = Person(
                    name: name,
                    fatherName: fatherName,
                    gmail: gmail,
                    job: job,
                    age: Int(age) ?? 0,
                    height: Float(height) ?? 0.0,
                    dp: imageData
                    
                )
                
                modelContext.insert(person)
                showSuccessAlert = true
            }
            .alert("Saved Successfully", isPresented: $showSuccessAlert) {
                Button("OK", role: .cancel) {
                    // Optional: Clear your text fields here if you want to reset the form
                    dismiss()
                    
                }
                .font(Font.largeTitle.bold())
            } message: {
                Text("\(name) has been added to your database.")
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}
#Preview {
    Form{
    }
}

