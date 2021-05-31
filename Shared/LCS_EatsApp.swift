//
//  LCS_EatsApp.swift
//  Shared
//
//  Created on 2021-01-28.
//
// Reasource used to create badge in tab view.
// Accessed 2021-03-21
//https://medium.com/flawless-app-stories/swiftui-tutorial-showing-badge-on-tab-bar-item-d71e4075b67a
//
//

import SwiftUI

struct LCS_EatsApp: View {
    
    @StateObject var order = Order(name: "", phoneNumberOrEmail: "", pickup: false, restaurant: .mcdonalds, items: [])
    @StateObject var store = OrderStore()
    @StateObject var app = AppState()
    @State private var currentTab = 0
    
    // These are used to make sure the badge is located in the correct spot
    private var badgePosition: CGFloat = 2
    private var tabsCount: CGFloat = 3
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack(alignment: .bottomLeading) {
                
                TabView {
                    
                    CreateOrderView(store: store)
                        .environmentObject(order)
                        .environmentObject(app)
                        .tabItem {
                            Image(systemName: "car.2")
                            Text("Order")
                        }
                    
                    
                    CheckoutView(store: store)
                        .environmentObject(order)
                        .environmentObject(app)
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Checkout")
                        }
                    
                    
                    InfoView()
                        .environmentObject(app)
                        .tabItem {
                            Image(systemName: "person.fill.questionmark")
                            Text("Info")
                        }
                    NavigationView {
                        
                        TabView(selection: $currentTab,
                                        content:  {
                                            ForEach(OnboardingData.list) { viewData in
                                                OnboardingView(data: viewData)
                                                    .tag(viewData.id)
                                            }
                                        })
                                    .tabViewStyle(PageTabViewStyle())
                                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                            }
                    .tabItem {
                        Image(systemName: "questionmark")
                        Text("Help")
                        
                    
                }
                
                // Badge
                ZStack {
                    Circle()
                        .foregroundColor(.red)
                    
                    // The number in the badge changes based on number of items in the order
                    Text("\(order.items.count)")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                }
                .frame(width: 15, height:15)
                .offset(x: (( 2 * badgePosition) - 0.95) * (geo.size.width / (2 * tabsCount)) + 2, y: -30)
                .opacity(order.items.count == 0 ? 0 : 1.0)
                }
            }
        }
    }
}
