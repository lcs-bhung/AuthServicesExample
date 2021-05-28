//
//  MenuView.swift
//  LCS Eats
//
//  Created on 2021-01-28.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var store: OrderStore
    
    @EnvironmentObject var order: Order
    
    @State private var menu = Menu()
    
    // This is changed by the picker. It is sent to the filteredItems func that decides what items will be shown in the menu view
    @State var itemType = FoodType.all
    
    // Sends a different menu based on the restaurant that was chosen. Returns a list of items that will be shown in the
    var itemList: [Item] {
        if order.restaurant.rawValue == "Mcdonald's" {
            return store.filteredItems(menu: menu.mcdonaldsMenu, itemType: itemType)
        } else {
            return store.filteredItems(menu: menu.timsMenu, itemType: itemType)
        }
    }
    
    var body: some View {
        Form {
            
            Section {
                
                // Picker to allow the user to sort through which items they would like to see
                if order.restaurant.rawValue == "Mcdonald's" {
                    // This picker will appear if the user choses McDonalds as their restaurant
                    Picker("Sort Menu", selection: $itemType) {
                        Text(FoodType.all.rawValue).tag(FoodType.all)
                        Text(FoodType.burger.rawValue).tag(FoodType.burger)
                        Text(FoodType.chicken.rawValue).tag(FoodType.chicken)
                        Text(FoodType.fries.rawValue).tag(FoodType.fries)
                        Text(FoodType.iceCream.rawValue).tag(FoodType.iceCream)
                        Text(FoodType.combo.rawValue).tag(FoodType.combo)
                        Text(FoodType.drink.rawValue).tag(FoodType.drink)
                    }.pickerStyle(MenuPickerStyle())
                } else {
                    // This picker will appear if the user choses Tim Hortons as their restaurant
                    Picker("Sort Menu", selection: $itemType) {
                        Text(FoodType.all.rawValue).tag(FoodType.all)
                        Text(FoodType.food.rawValue).tag(FoodType.food)
                        Text(FoodType.bakery.rawValue).tag(FoodType.bakery)
                        Text(FoodType.drink.rawValue).tag(FoodType.drink)
                    }.pickerStyle(MenuPickerStyle())
                }
                
            }
            
            // Header of section set to the menu being shown
            Section(header: Text(itemType.rawValue)
                        .bold()
                        .font(.title3)
                        .foregroundColor(.primary)
                        .textCase(nil)
                        .padding(.top)) {
                
                // Itterates over the items that are going to be shwon
                ForEach(itemList, id: \.id) { item in
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70, alignment: .center)
                        Text(item.name)
                        
                        Spacer()
                        
                        // This button appends the item they chose to the orders items array
                        Button(action: {
                            order.items.append(item)
                        }) {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
            }
        }.navigationTitle("\(order.restaurant.rawValue) Menu")
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView(store: testStore)
            
        }
    }
}
