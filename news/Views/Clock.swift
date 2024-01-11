//
//  Clock.swift
//  news
//
//  Created by Joel Martin on 12/1/23.
//

import SwiftUI

struct Clock: View {

    @State var currentDate = Date.now
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Text("\(currentDate)")
                .onReceive(timer) { input in
                    currentDate = input
                }
        }
        
    }
}

struct Clock_Previews: PreviewProvider {
    static var previews: some View {
        Clock()
    }
}
