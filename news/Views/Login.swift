//
//  Login.swift
//  news
//
//  Created by Joel Martin on 12/15/23.
//

import Foundation
import SwiftUI

struct Login: View {
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            let isLandscape = screenWidth > screenHeight

            VStack {
                Spacer()
                if !isLandscape {
                    //TITLE
                    Text("Login")
                        .font(.custom("Deutschlander", size: 40))
                        .tracking(1)
                        .padding(.top)
                        

                } else {
                    Spacer()
                }

                VStack {
                    //CONTACT FORM (non-functional)
                    CoolTextField(field: $userName, placeholder: "Username...", systemImage: "person.fill.questionmark.rtl")
                    Spacer().frame(maxHeight: 30)
                    CoolTextField(field: $password, placeholder: "Password...", systemImage: "person.badge.key.fill")
                }

                
                Spacer()
                // SEND BUTTON
                NavigationLink {
                    // Was planning on sending to some confirmation page
                    Login()
                    // Could have sent the state variables as data to the login page
                } label: {
                    Label(
                        "Login", systemImage: "computermouse"
                    )
                }
                .frame(width: 100, height: 50)
                .background(.black)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(lineWidth: 2))
                
                if !isLandscape {
                    //SOCIAL BAR
                    Social().padding(.top, 20)
                }
            }
            .foregroundColor(.white)
        }

    }
    
}

