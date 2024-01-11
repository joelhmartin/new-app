//
//  NavBar.swift
//  news
//
//  Created by Joel Martin on 11/29/23.
//

import SwiftUI
import Foundation

struct NavBar: View {
    // Binds to variable in 'ContentView'
    @Binding var screens: ScreenChoice
    
    var body: some View {
        
        HStack {

            Button(action: {screens = .home}, label: {
                Text("BSNews")
                    .font(.custom("Pink Yellow Black", size: 50))
            })
            Spacer()
            
            Menu {
                Button(action: {screens = .login}) {
                    Label("Login/Register", systemImage: "clipboard")
                }
                Button(action: {screens = .contact}) {
                    Label("Contact", systemImage: "square.and.pencil")
                }
            } label: {
                Label("Menu", systemImage: "square.and.arrow.down")
                    .font(.custom("Deutschlander", size: 40))
            }
        }
        .frame(maxWidth: .infinity, alignment: .center).padding(.horizontal, 10)
        .foregroundColor(.white)
        .padding(.bottom, -20)
    }
}
