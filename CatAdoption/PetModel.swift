//
//  PetModel.swift
//  CatAdoption
//
//  Created by Paulus Michael on 02/04/24.
//

import Foundation

struct PetModel{
    let name: String
    let type: String
    let distance: Double
    let weight: Double
    let gender: String
    
    static func generateLeppyData() -> PetModel{
        let pet = PetModel(name: "Leppy", type: "Domestic", distance: 1.0, weight: 3.0, gender: "Male")
        
        return pet
    }
}
