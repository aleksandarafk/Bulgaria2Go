//
//  ModelData.swift
//  Places
//
//  Created by Aleksandar Karamirev on 20/02/2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var places: [Place] = load("landmarkData.json")
    @Published var profile = Profile.default
    
    var features: [Place]{
        places.filter { $0.isFeatured }
    }
    
    var categories: [String: [Place]]{
        Dictionary(
            grouping: places,
            by: {$0.category.rawValue}
            )
    }
}



var places: [Place] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error).")
    }
}
