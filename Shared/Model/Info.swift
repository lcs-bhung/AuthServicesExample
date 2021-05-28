//
//  Info.swift
//  LCS Eats
//
//  Created on 2021-01-29.
//

import Foundation

struct Info: Decodable {
    let text: String
    let children: [Info]?
    
}
