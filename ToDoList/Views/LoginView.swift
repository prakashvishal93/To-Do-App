//
//  LoginView.swift
//  ToDoList
//
//  Created by RaJ TiWaRi on 14/01/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                // Header
                HeaderView(title:"To Do List" ,
                           subtitle: "Get things done",
                           angle: 15, background: .blue)
                
                
                //Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email )
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password )
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In",
                             background: .green){
                        //Attemp log in
                        viewModel.login()
                        
                    }
                    
                }
                .offset(y: -50)

                // create account
                VStack{
                    Text("New Around Here?")
                    }
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 40)
                
                Spacer()
            }
        }
    }
    


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
