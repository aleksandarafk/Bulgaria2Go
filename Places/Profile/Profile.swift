//
//  Profile.swift
//  Place
//
//  Created by Aleksandar Karamirev on 22/02/2023.
//

import Foundation

//variables for what the profile page incldes
struct Profile {
    var username: String
    
    //default username - can be changed by the user, however it won't be saved
    //since there is no database involved
    static let `default` = Profile(username: "aleksandarn")
    
}


