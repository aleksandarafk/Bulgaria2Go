//
//  ProfileTest.swift
//  Places
//
//  Created by Aleksandar Karamirev on 21/02/2023.
//

import SwiftUI


struct ProfileTest: View {
    //enviromental object for the modelData
    //variable for the profile view
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    @State private var shouldShowHomeView = false
    @State private var shouldShowAlert = false
    
    //body design of the whole profile page
    //including the hikes
    var body: some View {
        List {
            AccountOverviewMenu(name: "Aleksandar Karamirev", email: "aleksandarn314@gmail.com", profilePicture: Image(systemName: "globe"))
            
            Text(profile.username)
            VStack(alignment: .leading){
                Text("Completed Badges")
                    .font(.headline)
                ScrollView(.horizontal){
                    HStack{
                        TravelBadges(name: "Used the App")
                            .onTapGesture {
                                let alert = UIAlertController(title: "Used the App", message: "You used our app for the first time!", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default))
                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                            }
                        TravelBadges(name: "Bookworm") .hueRotation(Angle(degrees:90))
                            .onTapGesture {
                                let alert = UIAlertController(title: "Bookworm", message: "You have read about every location! You are a bit smarter now.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default))
                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                            }
                        TravelBadges(name: "Used the Map")
                            .hueRotation(Angle(degrees: 300))
                            .onTapGesture {
                                let alert = UIAlertController(title: "Used the Map", message: "It doesn't matter how old we are, we always need directions.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default))
                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                            }
                        
                    }
                }
                .padding(.bottom)
            }
            VStack(alignment: .leading){
                Text("Uncompleted Badges")
                    .font(.headline)
                ScrollView(.horizontal){
                    HStack{
                        TravelBadges(name: "100% Explorer")
                            .grayscale(1)
                            .onTapGesture {
                                let alert = UIAlertController(title: "100% Explorer", message: "Be proud! You've visited every destination in our app.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default))
                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                            }
                        TravelBadges(name: "Random Location")
                            .grayscale(1)
                            .onTapGesture {
                                let alert = UIAlertController(title: "Random Location", message: "Just explore the unknown. You will like it.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default))
                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                            }
                        TravelBadges(name: "365 Days")
                            .grayscale(1)
                            .onTapGesture {
                                let alert = UIAlertController(title: "365 Days", message: "You used our app for 365 days ! You must be really proud of yourself.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default))
                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                            }
                    }
                    .padding(.bottom)
                }
            }
            VStack{
                Button("Delete my Account", role: .destructive, action: {
                    shouldShowAlert = true
                })
                .frame(maxWidth: .infinity)
                .buttonStyle(.bordered)
                .controlSize(.regular)
                .padding()
                .alert(isPresented: $shouldShowAlert) {
                    Alert(
                        title: Text("Are you sure you want to proceed?"),
                        message: Text("This action cannot be undone."),
                        primaryButton: .destructive(Text("Delete"), action: {
                            shouldShowHomeView = true
                        }),
                        secondaryButton: .cancel(Text("Cancel"))
                    )
            }
            .fullScreenCover(isPresented: $shouldShowHomeView, content: ContentView.init)
                        }
        }
        .listStyle(.insetGrouped)
    }
}
struct ProfileTest_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTest(profile: Profile.default)
            .environmentObject(ModelData())

    }
}
