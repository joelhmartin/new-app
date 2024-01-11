//
//  TopHeadLineCaption.swift
//  news
//
//  Created by Joel Martin on 12/15/23.
//

import Foundation
import SwiftUI

struct TopHeadlineCaption: View {
    let text: String
    var body: some View {
        VStack{
            Spacer()
            Text(text)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }.frame(width: 340, height: 200)
    }
}
