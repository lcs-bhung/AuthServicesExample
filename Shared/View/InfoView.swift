//
//  Info.swift
//  LCS Eats
//
//  Created on 2021-01-29.
//

import SwiftUI

struct InfoView: View {
    
    let info: [Info]
    
    var body: some View {
        
        List(info, id: \.text, children: \.children) { info in

            if info.children != nil {
                
                Label(info.text, systemImage: "quote.bubble")
                    .font(.headline)
            } else {
                Text(info.text)
                    .font(.body)
            }

        }.navigationTitle("Info")
        
    }
    
    init() {
        
        // Get pointer to file
        let url = Bundle.main.url(forResource: "info", withExtension: "json")!
        
        // Load the contents of the JSON file
        let data = try! Data(contentsOf: url)
        
        // Convert the data from the JSON file to the array
        info = try! JSONDecoder().decode([Info].self, from: data)
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
