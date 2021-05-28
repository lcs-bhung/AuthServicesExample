//
//  Order.swift
//  LCS Eats
//
//  Created on 2021-01-28.
//

import Foundation
import Combine

class Order: ObservableObject, Identifiable {
    
    var id = UUID()
    @Published var name: String
    @Published var phoneNumberOrEmail: String
    @Published var pickup: Bool
    @Published var restaurant: Restaurant
    @Published var items: [Item]
    
    // Iterate over the price of each item and add it to "price"
    var itemPrice: Double {
        var price = 0.0
        for item in items {
            price += item.price
        }
        return price
    }
        
    // Multiply the price of the items buy sales tax (13%)
    var tax: Double {
        return itemPrice * 0.13
    }
    
    // If the itemPrice + tax is between two prices, return a value for the delivery
    var delivery: Double {
        switch itemPrice + tax {
        case 0..<5: return 2
        case 5..<10: return 4
        case 10..<20: return 5
        case 20...: return 7
        default: return 0
        }
    }
    
    // Return the total price, which is the prices of the items, the tax and the delivery added together
    var totalPrice: Double {
        return itemPrice + tax + delivery
    }
    
    internal init(name: String, phoneNumberOrEmail: String, pickup: Bool, restaurant: Restaurant, items: [Item]) {
        self.name = name
        self.phoneNumberOrEmail = phoneNumberOrEmail
        self.pickup = pickup
        self.restaurant = restaurant
        self.items = items
    }

        
}

let testData = [Order(name: "scott", phoneNumberOrEmail: "9057853261", pickup: true, restaurant: .mcdonalds, items: [testItem])]
