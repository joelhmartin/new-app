//
//  Exclamation.swift
//  news
//
//  Created by Joel Martin on 12/1/23.
//

import SwiftUI

// Iterates through the gif images with a timer to create an animation effect

private let images = ["exlamation1","exlamation2","exlamation3",]
private let periods = [".","..","...",]

struct Exclamation: View {
    @State private var count = 0
    @State var imageUpdate = "exclamation1"
    let text: String
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Image(images[count])
                .resizable()
                .onReceive(timer) { input in
                    if count == 2 {
                        count = -1
                    }
                    count += 1
                }
            Text("\(text)\(periods[count])")
                .foregroundColor(.white)
        }
    }
}
