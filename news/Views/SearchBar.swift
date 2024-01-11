//
//  SearchBar.swift
//  news
//
//  Created by Joel Martin on 11/30/23.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var savedIsOn: Bool
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search...", text: $searchText)
                .foregroundColor(.black)
                .font(.custom("Deutschlander", size: 22))
                .tracking(1)
            
            SearchCountry()
        }
        .textFieldStyle(OvalTextFieldStyle())
        .padding()
        .foregroundColor(.white)
        .shadow(color: Color.black, radius: 3, x: 2, y: 2)
        .shadow(color: Color.white, radius: 3, x: -2, y: -2)
        
    }
}
