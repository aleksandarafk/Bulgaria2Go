//
//  Placeist.swift
//  Place
//
//  Created by Aleksandar Karamirev on 10/02/2023.
//

import SwiftUI

    //how the landmarks should appear + a filter for favorite only
struct PlaceList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
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

    var filteredPlaces: [Place] {
        modelData.places.filter { place in
            (!showFavoritesOnly || place.isFavorite) &&
                (searchText.isEmpty || place.name.localizedStandardContains(searchText))
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                List(filteredPlaces) { place in
                    NavigationLink(destination: PlaceDetail(place: place)) {
                        LandmarkCard(place: place)
                    }
                }
                .listStyle(GroupedListStyle())

                Toggle(isOn: $showFavoritesOnly) {
                    Text("favorites".localizableString(languages[selectedLanguage]))
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
            .navigationTitle("landmarks".localizableString(languages[selectedLanguage]))
            .environment(\.layoutDirection, languages[selectedLanguage] == "ar" ? .rightToLeft : .leftToRight)
        }
            
    }
}

struct LandmarkCard: View {
    var place: Place

    var body: some View {
        HStack {
            place.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)

            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(place.park)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            if place.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 5)
    }
}

struct SearchBar: View {
    @Binding var text: String
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
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            TextField("search".localizableString(languages[selectedLanguage]), text: $text)
                .foregroundColor(.primary)
        }
        .padding(8)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}


struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList().environmentObject(ModelData())
        }
    }

