//
//  ProfileSummary.swift
//  Place
//
//  Created by Aleksandar Karamirev on 22/02/2023.
//

import SwiftUI

struct ProfileSummary: View {
    //enviromental object for the modelData
    //variable for the profile view
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    @State private var showContentView = false
    @State private var showAlert = false
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

    //body design of the whole profile page
    //including the hikes
    var body: some View {
        List {
                VStack {
                    AccountOverviewMenu(name: "name".localizableString(languages[selectedLanguage]), email: "aleksandarn314@gmail.com", profilePicture: Image("Profile"))
                    NavigationLink(destination: ProfileSummary( profile: Profile.default)) {
                    VStack {
                        AccountUsername(name: profile.username.localizableString(languages[selectedLanguage]))
                    }
                }
            }
            Section(header: Text("completed".localizableString(languages[selectedLanguage]))) {
                ScrollView(.horizontal) {
                    HStack{
                        TravelBadges(name: "appuse".localizableString(languages[selectedLanguage]))
                        TravelBadges(name: "bookworm".localizableString(languages[selectedLanguage]))
                            .hueRotation(Angle(degrees:90))
                        TravelBadges(name: "usemap".localizableString(languages[selectedLanguage]))
                            .hueRotation(Angle(degrees: 300))
                    }
                }
                .padding(.bottom)
            }
            
            Section(header: Text("uncompleted".localizableString(languages[selectedLanguage]))) {
                ScrollView(.horizontal) {
                    HStack{
                        TravelBadges(name: "explorer".localizableString(languages[selectedLanguage]))
                            .grayscale(1)
                        TravelBadges(name: "random".localizableString(languages[selectedLanguage]))
                            .grayscale(1)
                        TravelBadges(name: "oneyear".localizableString(languages[selectedLanguage]))
                            .grayscale(1)
                    }
                    .padding(.bottom)
                }
            }
            VStack{
                Button("delete".localizableString(languages[selectedLanguage]), role: .destructive, action: {
                    showAlert = true
                })
                .frame(maxWidth: .infinity)
                .buttonStyle(.bordered)
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("message1".localizableString(languages[selectedLanguage])),
                        message: Text("message2".localizableString(languages[selectedLanguage])),
                        primaryButton: .destructive(Text("del".localizableString(languages[selectedLanguage])), action: {
                            showContentView = true
                        }),
                        secondaryButton: .cancel(Text("cancel".localizableString(languages[selectedLanguage])))
                    )
                }
                .fullScreenCover(isPresented: $showContentView, content: ContentView.init)
            }
        }
        .listStyle(.insetGrouped)
        .environment(\.layoutDirection, languages[selectedLanguage] == "ar" ? .rightToLeft : .leftToRight)

    }
}
struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
