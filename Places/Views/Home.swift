//
//  Home.swift
//  Places
//
//  Created by Aleksandar Karamirev on 20/02/2023.
//

import SwiftUI

//the category home page as seen in the content view
struct Home: View {
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
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    PageView(pages: modelData.features.map { place in
                        NavigationLink(destination: PlaceDetail(place: place)) {
                            FeaturedCard(place: place)
                        }
                    })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                }
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Row(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                .padding()
            }
            .overlay(
                ProfileView()
                    .padding(.trailing, 20)
                    .offset(x: 0, y: -45)
                , alignment: .topTrailing)
            .navigationTitle("popular".localizableString(languages[selectedLanguage]))
            .environment(\.layoutDirection, languages[selectedLanguage] == "ar" ? .rightToLeft : .leftToRight)
        }
    }
}

extension String {
    func localizableString(_ language: String) -> String {
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

struct ProfileView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        Image("Profile")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ModelData())
    }
}
