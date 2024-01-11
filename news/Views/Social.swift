//
//  Social.swift
//  news
//
//  Created by Joel Martin on 12/1/23.
//

import SwiftUI

struct Social: View {
    
    var body: some View {
        //SOCIAL
        HStack {
            SocialItem(text: "twitter")
            Spacer()
            SocialItem(text: "fb")
            Spacer()
            SocialItem(text: "insta")
        }
        .padding(.horizontal, 40)
    }
}

struct SocialItem: View {
    let text: String
    var body: some View {
        HStack {
            Image("\(text)")
                .resizable()
                .frame(width: 40, height: 40)
                .background(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}
