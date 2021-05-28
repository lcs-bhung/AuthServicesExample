//
//  MenuItems.swift
//  LCS Eats
//
//  Created on 2021-03-04.
//

import Foundation

struct Item: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
    let type: FoodType
}

var testItem = Item(name: "Burger", price: 4.00, imageName: "MDbigmac", type: FoodType.burger)
