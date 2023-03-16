//
//  AccountUsername.swift
//  Place
//
//  Created by Aleksandar Karamirev on 22/02/2023.
//

import SwiftUI

struct AccountUsername: View {
    var name: String
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
        HStack(spacing: 16) {
            
            VStack(alignment: .leading, spacing: 4) {
                Text("username".localizableString(languages[selectedLanguage]))
                    
            }
            Spacer()
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AccountUsername_Previews: PreviewProvider {
    static var previews: some View {
        AccountUsername(name: "aaa")
    }
}
