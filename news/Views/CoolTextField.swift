//
//  CoolTextField.swift
//  news
//
//  Created by Joel Martin on 12/15/23.
//

import Foundation
import SwiftUI

struct CoolTextField: View {
    @Binding var field: String
    let placeholder: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
            TextField(placeholder, text: $field, axis: .vertical)
                .foregroundColor(.black)
                .font(.custom("Deutschlander", size: 30))
        }
        .tracking(1)
        .textFieldStyle(OvalTextFieldStyle())
        .foregroundColor(.white)
        .shadow(color: Color.black, radius: 3, x: 2, y: 2)
        .shadow(color: Color.gray, radius: 3, x: -2, y: -2)
    }

}
