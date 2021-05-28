//
//  Menu.swift
//  LCS Eats
//
//  Created on 2021-03-04.
//

import Foundation

class Menu: ObservableObject {
    
    var mcdonaldsMenu = [
        // Burgers
        Item(name: "Big Mac", price: 6.19, imageName: "MDbigmac", type: FoodType.burger),
        Item(name: "Double Big Mac", price: 8.19, imageName: "MDdoublebigmac", type: FoodType.burger),
        Item(name: "Quarter Pounder With Cheese", price: 6.19, imageName: "MDquarterpounderwithcheese", type: FoodType.burger),
        Item(name: "Double Quarter Pounder With Cheese", price: 8.19, imageName: "MDdoublequarterpounderwithcheese", type: FoodType.burger),
        Item(name: "Cheeseburger", price: 2.39, imageName: "MDcheeseburger", type: FoodType.burger),
        Item(name: "Double Cheeseburger", price: 2.99, imageName: "MDdoublecheeseburger", type: FoodType.burger),
        Item(name: "Hamburger", price: 2.19, imageName: "MDhamburger", type: FoodType.burger),
        Item(name: "McDouble", price: 2.79, imageName: "MDmcdouble", type: FoodType.burger),
        
        // Chicken
        Item(name: "McChicken", price: 6.19, imageName: "MDmcchicken", type: FoodType.chicken),
        Item(name: "Junior Chicken", price: 2.49, imageName: "MDjuniorchicken", type: FoodType.chicken),
        Item(name: "6 Chicken McNuggets", price: 6.99, imageName: "MD6piecenuggets", type: FoodType.chicken),
        Item(name: "10 Chicken McNuggets", price: 8.99, imageName: "MD10piecenuggets", type: FoodType.chicken),
        Item(name: "20 Chicken McNuggets", price: 13.99, imageName: "MD20piecenuggets", type: FoodType.chicken),

        // Fries
        Item(name: "Small Fries", price: 1.99, imageName: "MDsmallfries", type: FoodType.fries),
        Item(name: "Medium Fries", price: 3.19, imageName: "MDmediumfries", type: FoodType.fries),
        Item(name: "Large Fries", price: 3.59, imageName: "MDlargefries", type: FoodType.fries),
        
        // IceCream
        Item(name: "Vanilla Cone", price: 1.79, imageName: "MDvanillacone", type: FoodType.iceCream),
        Item(name: "Fudge Sundae", price: 2.89, imageName: "MDfudgesundae", type: FoodType.iceCream),
        Item(name: "Caramel Sundae", price: 2.89, imageName: "MDcaramelsundae", type: FoodType.iceCream),
        Item(name: "Regular McFlurry", price: 3.99, imageName: "MDlargemcflurry", type: FoodType.iceCream),
        Item(name: "Mini McFlurry", price: 3.29, imageName: "MDsmallmcflurry", type: FoodType.iceCream),
        
        // Combos
        Item(name: "Quarter Pounder Combo", price: 10.49, imageName: "MDquarterpounderwithcheesecombo", type: FoodType.combo),
        Item(name: "Double Quarter Pounder Combo", price: 12.49, imageName: "MDdoublequarterpounderwithcheesecombo", type: FoodType.combo),
        Item(name: "Big Mac Combo", price: 9.49, imageName: "MDbicmaccombo", type: FoodType.combo),
        Item(name: "6 McNuggetts Combo", price: 9.99, imageName: "MD6piecenuggets", type: FoodType.combo),
        Item(name: "10 McNuggetts Combo", price: 12.99, imageName: "MD10piecenuggets", type: FoodType.combo),
        Item(name: "20 McNuggetts Combo", price: 19.99, imageName: "MD20piecenuggets", type: FoodType.combo),
        
        // Drinks
        Item(name: "Coke", price: 2.39, imageName: "MDcoke", type: FoodType.drink),
        Item(name: "Diet Coke", price: 2.39, imageName: "MDdietcoke", type: FoodType.drink),
        Item(name: "Dr. Pepper", price: 2.39, imageName: "MDdrpepper", type: FoodType.drink),
        Item(name: "Fanta", price: 2.39, imageName: "MDfanta", type: FoodType.drink),
        Item(name: "Sprite", price: 2.39, imageName: "MDsprite", type: FoodType.drink),
        Item(name: "Iced Coffee", price: 2.19, imageName: "MDicecoffee", type: FoodType.drink),
        Item(name: "Mango Pineapple Smoothie", price: 3.69, imageName: "MDmangopineapplesmoothie", type: FoodType.drink),
        Item(name: "Stawberry Banana Smoothie", price: 3.69, imageName: "MDstawberrybananasmoothie", type: FoodType.drink),
        Item(name: "Vanilla Milkshake", price: 3.99, imageName: "MDvanillashake", type: FoodType.drink),
        Item(name: "Chocolate Milkshake", price: 3.99, imageName: "MDchocolateshake", type: FoodType.drink),
        Item(name: "Strawberry Milkshake", price: 3.99, imageName: "MDstrawberryshake", type: FoodType.drink)
    ]

    var timsMenu = [
        
        // Bakery
        Item(name: "Donut", price: 0.99, imageName: "THdonut", type: FoodType.bakery),
        Item(name: "Muffin", price: 1.49, imageName: "THmuffin", type: FoodType.bakery),
        Item(name: "Danish", price: 1.49, imageName: "THdanish", type: FoodType.bakery),
        Item(name: "Croissant", price: 1.49, imageName: "THcroissant", type: FoodType.bakery),
        Item(name: "Cinnamon Bun", price: 2.49, imageName: "THcinnamonbun", type: FoodType.bakery),
        Item(name: "10 Timbits", price: 2.49, imageName: "THtimbits", type: FoodType.bakery),
        Item(name: "Cookie", price: 0.99, imageName: "THcookie", type: FoodType.bakery),
        Item(name: "Filled Cookie", price: 1.49, imageName: "THfilledcookie", type: FoodType.bakery),
        
        // Food
        Item(name: "Wrap", price: 3.99, imageName: "THwrap", type: FoodType.food),
        Item(name: "Turkey Bacon Club", price: 3.99, imageName: "THturkeybaconclub", type: FoodType.food),
        Item(name: "Potatoe Wedges", price: 2.29, imageName: "THpotatowedges", type: FoodType.food),
        Item(name: "Bagel with Butter", price: 1.19, imageName: "THbagelwithbutter", type: FoodType.food),
        Item(name: "Bagel with Cream Cheese", price: 2.19, imageName: "THbagelwithcreamcheese", type: FoodType.food),

        // Drink
        Item(name: "Coffee", price: 1.79, imageName: "THcoffee", type: FoodType.drink),
        Item(name: "Tea", price: 1.79, imageName: "THtea", type: FoodType.drink),
        Item(name: "Cappuccino", price: 3.09, imageName: "THcappuccino", type: FoodType.drink),
        Item(name: "French Vanilla", price: 2.29, imageName: "THfrenchvanilla", type: FoodType.drink),
        Item(name: "Latte", price: 3.09, imageName: "THlatte", type: FoodType.drink),
        Item(name: "Mocha", price: 3.39, imageName: "THmocha", type: FoodType.drink),
        Item(name: "Hot Chocolate", price: 1.99, imageName: "THhotchocolate", type: FoodType.drink),
        Item(name: "Iced Coffee", price: 1.99, imageName: "THicecoffee", type: FoodType.drink),
        Item(name: "Iced Capp", price: 2.59, imageName: "THicedcapp", type: FoodType.drink),
        Item(name: "Iced Latte", price: 3.09, imageName: "THicedlatte", type: FoodType.drink),
        Item(name: "Iced Tea", price: 3.39, imageName: "THicedtea", type: FoodType.drink),
        Item(name: "Smoothie", price: 3.59, imageName: "THsmoothie", type: FoodType.drink),
        Item(name: "Frozen Lemonade", price: 2.29, imageName: "THfrozenlemonade", type: FoodType.drink)
    ]
    
}
