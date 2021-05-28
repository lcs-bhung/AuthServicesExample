//
//  OrderStore.swift
//  LCS Eats
//
//  Created on 2021-03-02.
//

import Foundation

class OrderStore: ObservableObject {
    @Published var orders: [Order]
    
    init(orders: [Order] = []) {
        self.orders = orders
    }
    
    // Function that returns the items that should be displayed based on the item type, chosen by the user
    func filteredItems(menu: [Item], itemType: FoodType) -> [Item] {
        
        if itemType == FoodType.all {
            // If the user wants to see all the items, return the menu of the restaurant they chose
            return menu
            
        } else {
            
            // Create an empty array of items, that will be populated and returned based on what was chosen.
            var matchingItems: [Item] = []
            
            for item in menu {
                // If the type of the item in the menu matches the type of the item they want to see, append it to the array
                if item.type == itemType {
                    matchingItems.append(item)
                }
            }
            // Return the array of items
            return matchingItems
        }
    }
}
let testStore = OrderStore(orders: testData)

