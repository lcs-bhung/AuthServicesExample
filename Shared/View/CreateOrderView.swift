//
//  CreateOrderView.swift
//  LCS Eats
//
//  Created on 2021-01-28.
//

import SwiftUI

struct CreateOrderView: View {
    
    // Access to shared authentication information
    @EnvironmentObject var sharedAuthenticationStore: SharedAuthentication

    @EnvironmentObject var order: Order
    @EnvironmentObject var app: AppState

    @ObservedObject var store: OrderStore
        
    var body: some View {
        VStack{
            Form {
                
                // Name section
                Section(header: Text("Name:")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.primary)
                            .textCase(nil)
                            .padding(.top)) {
                    Text("\(sharedAuthenticationStore.userName)")
                }
                
                // Contact info section
                Section(header: Text("Email:")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.primary)
                            .textCase(nil)
                            .padding(.top)) {
                    Text("\(sharedAuthenticationStore.userEmail)")
                }
                
                // Restaurant choice section
                Section(header: Text("Restaurant:")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.primary)
                            .textCase(nil)
                            .padding(.top)) {
                    Picker("Restaurant", selection: $order.restaurant) {
                        Text(Restaurant.mcdonalds.rawValue).tag(Restaurant.mcdonalds)
                        Text(Restaurant.timHortons.rawValue).tag(Restaurant.timHortons)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // Section that lets user reflect on if they are able to pick up the food at the given time
                Section(header: Text("Are you available to pickup your order?")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.primary)
                            .textCase(nil)
                            .padding(.top)) {
                    Picker("Pickup", selection: $order.pickup) {
                        Text("No").tag(false)
                        Text("Yes").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            }
            NavigationLink(destination: MenuView(store: store).environmentObject(order), label : {
                Text("Next")
                    .bold()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .padding(.top, -10)
            })
        }.navigationTitle(app.navigationTitle)
        
    }
}

struct CreateOrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateOrderView(store: testStore)
                .environmentObject(Order(name: "", phoneNumberOrEmail: "", pickup: true, restaurant: Restaurant.mcdonalds, items: []))
        }
    }
}
