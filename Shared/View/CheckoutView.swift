//
//  CartView.swift
//  LCS Eats
//
//  Created on 2021-03-11.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    @ObservedObject var store: OrderStore
    
    // Changes if alert needs to be shown
    @State private var showingEmailAlert = false
    
    // Used to open website if user has not set up an email account
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        if order.items.isEmpty {
            Text("Cart is empty")
                .font(.title)
                .foregroundColor(Color.gray)
                .navigationTitle("Checkout")
        } else {
            ZStack {
                VStack{
                    Form {
                        
                        // Section to dislay the users name
                        Section(header: Text("Name:")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.primary)
                                    .textCase(nil)
                                    .padding(.top)) {
                            // If the user didn't input a name, display a red "No Name" text
                            if order.name.isEmpty {
                                Text("No Name")
                                    .foregroundColor(.red)
                            } else {
                                Text("\(order.name)")
                            }
                            
                        }
                        
                        // Section to dislay the users contact info
                        Section(header: Text("Contact Info:")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.primary)
                                    .textCase(nil)
                                    .padding(.top)) {
                            // If the user didn't input a name, display a red "No Name" text
                            if order.phoneNumberOrEmail.isEmpty {
                                Text("No Contact Info")
                                    .foregroundColor(.red)
                            } else {
                                Text("\(order.phoneNumberOrEmail)")
                            }
                            
                        }
                        
                        // Create a list of all of the users items
                        Section(header: Text("Items:")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.primary)
                                    .textCase(nil)
                                    .padding(.top)) {                            
                            // Loop that creates a cell view for each item
                            ForEach(order.items) { item in
                                HStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 70, height: 70, alignment: .center)
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                        Text("$" + String(item.price))
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    
                                    // This button removes the item from the order if the user no longer wants the item
                                    Button(action: {
                                        if let index = order.items.firstIndex(of: item) {
                                            order.items.remove(at: index)
                                        }
                                    }) {
                                        Image(systemName: "minus.circle")
                                    }
                                }
                            }
                        }
                        
                        // Section for price of items
                        Section(header: Text("Item Price:")
                                    .font(.subheadline)) {
                            Text(String(format: "$%.2f", order.itemPrice))
                        }
                        
                        // Section for tax
                        Section(header: Text("Tax:")
                                    .font(.subheadline)) {
                            Text(String(format: "$%.2f", order.tax))
                        }
                        
                        // Section for delivery
                        Section(header: Text("Delivery:")
                                    .font(.subheadline)) {
                            Text(String(format: "$%.2f", order.delivery))
                        }
                        
                        // Section for total price of order
                        Section(header: Text("Total:")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.primary)
                                    .textCase(nil)) {
                            Text(String(format: "$%.2f", order.totalPrice))
                                .font(.headline)
                        }
                        
                    }.padding(.bottom, 50)
                    
                }.navigationTitle("Checkout")
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        
                        // Create message based on the order
                        let message = returnMessage(order: order)
                                                
                        do {
                            // Try to prepare email to be sent
                            try EmailHelper.shared.sendEmail(subject: "LCS Eats Order", body: message)
                        } catch {
                            showingEmailAlert = true
                        }
                        
                    }) {
                        Text(String(format: "Place Order: $%.2f", order.totalPrice))
                            .bold()
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 60)
                            .background(Color.blue)
                            .foregroundColor(.white)
                    }
                }
            }.alert(isPresented: $showingEmailAlert) {
                Alert(
                    title: Text("Cannot send email"),
                    message: Text("No email client is configured. Please add an email account to your device."),
                    primaryButton: .default(Text("Learn How")) {
                        openURL(URL(string: "https://support.apple.com/en-us/HT201320")!)
                    },
                    secondaryButton: .default(Text("Not Now"))
                )
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(store: testStore)
            
        }
    }
}
