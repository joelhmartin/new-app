//
//  SearchCountry.swift
//  news
//
//  Created by Joel Martin on 12/1/23.
//

import SwiftUI

let countryCodes = [
    "ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "cz",
    "de", "eg", "fr", "gb", "gr", "hk", "hu", "id", "ie", "il", "in", "it", "jp",
    "kr", "lt", "lu", "lv", "ma", "mx", "my", "ng", "nl", "no", "nz", "ph", "pl",
    "pt", "ro", "rs", "ru", "sa", "se", "sg", "sk", "th", "tr", "tw", "ua", "us",
    "ve", "za"
]

struct SearchCountry: View {
    @EnvironmentObject var apiService: APIService
    @State private var searchCountry = "us"
    
    var body: some View {
        Menu {
            ForEach(countryCodes, id: \.self) { countryCode in
                Button(countryNames[countryCode]!) {
                    searchCountry = countryCode
                    apiService.country = searchCountry
                    apiService.getAll()
                }
            }
        } label: {
            Label(countryNames[searchCountry] ?? "Country", systemImage: "globe.desk")
                .font(.custom("Deutschlander", size: 20))
        }
    }
}
