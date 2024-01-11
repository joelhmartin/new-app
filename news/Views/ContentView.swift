//
//  ContentView.swift
//  news
//
//  Created by Joel Martin on 11/28/23.
//

import SwiftUI
import Kingfisher

enum ScreenChoice {
    case home
    case contact
    case login
}

struct ContentView: View {
    
    // Sets what page is being viewed
    @State private var screens: ScreenChoice = .home
    // Api service 
    @ObservedObject private var apiService = APIService()
    
    var body: some View {

        // Checks if in landscape mode
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            VStack{
                //Nav is always displayed
                // NavBar can determine what is displayed beneath with 'screens'
                NavBar(screens: $screens)
                
                switch screens {
                case .home:
                    VStack {
                        if !isLandscape {
                            TopHeadlines()
                                .environmentObject(apiService)
                        }
                        SearchDisplay()
                            .environmentObject(apiService)
                    }
                case .contact:
                    Contact()
                case .login:
                    Login()
                }
            }
            .background(Image("blackNoise"))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
