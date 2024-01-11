//
//  Contact.swift
//  news
//
//  Created by Joel Martin on 11/30/23.
//

import Foundation
import SwiftUI
import MessageUI

struct Contact: View {
    @State private var name = ""
    @State private var email = ""
    @State private var question = ""
    
    var body: some View {
        
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            let isLandscape = screenWidth > screenHeight

            VStack {
                Spacer()
                if !isLandscape {
                    //TITLE
                    Text("Hit us up")
                        .font(.custom("Deutschlander", size: 40))
                        .tracking(1)
                        .padding(.top)
                        

                } else {
                    Spacer()
                }

                VStack {
                    //CONTACT FORM (non-functional)
                    CoolTextField(field: $name, placeholder: "Name...", systemImage: "person.fill.questionmark.rtl")
                    Spacer().frame(maxHeight: 30)
                    CoolTextField(field: $email, placeholder: "Email...", systemImage: "envelope.fill")
                    Spacer().frame(maxHeight: 30)
                    CoolTextField(field: $question, placeholder: "Question...", systemImage: "questionmark.square.fill")
                }

                
                Spacer()
                // SEND BUTTON
                NavigationLink {
                    // Was planning on sending to some confirmation page
                    Contact()
                    // Could have sent the state variables as data to the login page
                } label: {
                    Label(
                        "Send", systemImage: "envelope.fill"
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
