//
//  ContentView.swift
//  Place
//
//  Created by Aleksandar Karamirev on 20/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    @State private var selectedLanguage: Int = {
        let languageCode = Locale.current.languageCode
        if languageCode == "ar" {
            return 1
        } else if languageCode == "bg" {
            return 2
        } else if languageCode == "nl" {
            return 3
        } else {
            return 0
        }
    }()

    let languages = ["en", "ar", "bg", "nl"]
    enum Tab{
        case featured
        case list
        case map
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection){
            Home()
                .tabItem{
                    Label("featured".localizableString(languages[selectedLanguage]), systemImage: "star")
                }
                .tag(Tab.featured)
            PlaceList()
                .tabItem{
                    Label("places".localizableString(languages[selectedLanguage]), systemImage: "list.bullet")
                }
                .tag(Tab.list)
            DestinationMap()
                .tabItem{
                    Label("map".localizableString(languages[selectedLanguage]), systemImage: "map")
                }
                .tag(Tab.map)
            ProfileSummary(profile: Profile.default)
                .tabItem{
                    Label("profile".localizableString(languages[selectedLanguage]), systemImage: "person.crop.circle")
                }
                .tag(Tab.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
