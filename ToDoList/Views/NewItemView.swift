//
//  NewItemView.swift
//  ToDoList
//
//  Created by RaJ TiWaRi on 14/01/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 30)
            
            Form {
                
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                DatePicker("DueDate", selection: $viewModel.dueDate)
                    .datePickerStyle(WheelDatePickerStyle())
                
                                    
                
                TLButton(
                    title: "Save",
                    background: .green
                ){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                        print(viewModel)
                    } else {
                        viewModel.showAlert = true
                    }
                    
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill all the field correctly.")
                )
            }
        }
    }
}


struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
