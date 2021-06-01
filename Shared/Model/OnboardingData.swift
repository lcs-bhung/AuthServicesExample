//
//  OnboardingData.swift
//  AuthServicesExample
//
//  Created by Branton Hung on 2021-05-31.
//


import Foundation

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let backgroundImage: String
    let objectImage: String
    let primaryText: String
    let secondaryText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0, backgroundImage: "onboarding-bg-1", objectImage: "onboarding-object-1", primaryText: "LCS Eats", secondaryText: "Order food in the Lakefield area"),
        OnboardingData(id: 1, backgroundImage: "onboarding-bg-2", objectImage: "onboarding-object-2", primaryText: "Lakefield restaurants", secondaryText: "Tim Hortorns, McDonalds and Pizza Hut"),
        OnboardingData(id: 2, backgroundImage: "onboarding-bg-3", objectImage: "onboarding-object-3", primaryText: "Go to the order tab to order", secondaryText: "Insert name, phone number and restaurant")
    ]
}
