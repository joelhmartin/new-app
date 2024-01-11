//
//  Caption.swift
//  news
//
//  Created by Joel Martin on 12/15/23.
//

import Foundation
import SwiftUI

struct Caption: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.custom("Deutschlander", size: 30))
            .tracking(1)
    }
}
