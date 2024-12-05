//
//  ContentView.swift
//  ARVRApp1
//
//  Created by Piyush Anand on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToARScene = false

        var body: some View {
            NavigationView {
                VStack {
                    Button("Go to AR Scene") {
                        navigateToARScene = true // Trigger the navigation
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    // Hidden NavigationLink for triggering the navigation
                    NavigationLink("", destination: NewARScreen(), isActive: $navigateToARScene)
                        .hidden()
                }
                .navigationBarTitle("Main Menu")
            }
        }
}


//#Preview {
//    ContentView()
//}
