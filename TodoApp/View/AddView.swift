//
//  AddView.swift
//  TodoApp
//
//  Created by Anand Stephan on 11/03/24.
//

import SwiftUI


struct AddView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listviewModel:ListViewModel
    
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    

    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(16)
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(16)
                        .background(Color.accentColor)
                })
                
                
            }.padding(16)
        }.navigationTitle("Add Todo")
            .alert(isPresented: $showAlert, content:getAlert)
    }
    
    func saveButtonTapped() {
        if textIsValid(){
            listviewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid()->Bool{
        if textFieldText.count < 3{
            alertTitle = "Your todo item should contain atleast 3 Characters 😕 "
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert()->Alert{
        return Alert(title:Text(alertTitle))
    }
}

#Preview {
    AddView()
}
