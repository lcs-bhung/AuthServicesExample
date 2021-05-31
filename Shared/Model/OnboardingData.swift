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
        OnboardingData(id: 0, backgroundImage: "onboarding-bg-1", objectImage: "onboarding-object-1", primaryText: "Pogchamps", secondaryText: "pogchamps"),
        OnboardingData(id: 1, backgroundImage: "onboarding-bg-2", objectImage: "onboarding-object-2", primaryText: "Pog", secondaryText: "Pog"),
        OnboardingData(id: 2, backgroundImage: "onboarding-bg-3", objectImage: "onboarding-object-3", primaryText: "Champs", secondaryText: "Champs")
    ]
}

