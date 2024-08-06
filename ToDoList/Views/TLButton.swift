//
//  TLButton.swift
//  ToDoList
//
//  Created by RaJ TiWaRi on 15/01/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()-> Void
    
    var body: some View {
        Button{
        action()
    } label: {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(background)
            Text(title)
                .foregroundColor(Color.white)
                .bold()
        }
        
    }
    .padding()

    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(
            title: "login",
            background: .blue){
                //action
            }
    }
}
