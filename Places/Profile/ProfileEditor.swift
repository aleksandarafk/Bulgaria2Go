//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Aleksandar Karamirev on 11/02/2023.
//

import SwiftUI

struct ProfileEditor: View {
    //profile editor value that saves the changes
    @Binding var profile: Profile
    //the editable things, which are then saved + their design
    var body: some View {
        List{
            HStack{
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
