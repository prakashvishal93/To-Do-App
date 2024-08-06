//
//  ContentView.swift
//  ToDoList
//
//  Created by RaJ TiWaRi on 14/01/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View{
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            // signed in
            TabView{
                ToDoListView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LoginView()
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
