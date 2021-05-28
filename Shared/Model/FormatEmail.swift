//
//  FormatEmail.swift
//  LCS Eats
//
//  Created on 2021-04-08.
//

import Foundation

func returnMessage(order: Order) -> String {
    
    var itemsString = ""
    
    // Create a string that includes the names of all the itesm added
    for item in order.items {
        itemsString = "\(itemsString) \(item.name),"
    }
    
    
    let body = """
Order for: \(order.name)

Contact info: \(order.phoneNumberOrEmail)

Restaurant: \(order.restaurant.rawValue)

Items: \(itemsString)

Item Price: \(String(format: "$%.2f", order.itemPrice))

Tax: \(String(format: "$%.2f", order.tax))

Delivery: \(String(format: "$%.2f", order.delivery))

Total: \(String(format: "$%.2f", order.totalPrice))

"""
    return body
}
