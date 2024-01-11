//
//  OvalTextField.swift
//  news
//
//  Created by Joel Martin on 11/30/23.
//

import Foundation
import SwiftUI

//Stole this one piece from here https://thehappyprogrammer.com/custom-textfield-in-swiftui
struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.white)
            .cornerRadius(20)
    }
}
