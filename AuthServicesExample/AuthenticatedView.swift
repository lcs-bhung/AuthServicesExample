//
//  AuthenticatedView.swift
//  AuthServicesExample
//
//  Created by Russell Gordon on 2021-04-06.
//

import SwiftUI

// This view is only shown when the user has been authenticated
// Customize as needed – this is the first view the user will see after logging in to your app
/// - Tag: accessing_user_details
struct AuthenticatedView: View {
    
    // Access to shared authentication information
    @EnvironmentObject var sharedAuthenticationStore: SharedAuthentication
    
    // Track user's mood
    @State private var mood: Double = 3
    
    // Obtains data from the spreadsheet
    @StateObject private var dataStore = VisitorsStore()
    
    // How many times has this user shared their mood?
    @State private var moodShareCount = 0
    
    var body: some View {
        
        LCS_EatsApp()
    }
    
    func saveAndSendUserInformation() {
        
        // Get current date and time as a string
        // For other formatting options, see:
        // https://developer.apple.com/documentation/foundation/dateformatter
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let now = df.string(from: Date())
        
        // Record user's mood on this visit to the app, for posterity
        
        let thisVisit = Visit(name: sharedAuthenticationStore.userName,
                              email: sharedAuthenticationStore.userEmail,
                              restaurant: "Restaurant",
                              items: "Items",
                              itemPrice: 1.1,
                              tax: 1.1,
                              delivery: 1.1,
                              total: 1.1)
        
        // Set visit information up to be sent to remote spreadsheet
        let newRowInSpreadsheet = NewVisit(row: thisVisit)
        
        // Actually encode and send the user's information
        do {
            try newRowInSpreadsheet.encodeAndWriteToEndpoint()
        } catch JSONSendError.encodingFailed {
            print("DEBUG: Could not encode data to JSON.")
        } catch {
            print("DEBUG: Something else unexpected went wrong.")
        }
        
        // Track times mood has been shared
        moodShareCount += 1
        
        
    }
    
}

struct AuthenticatedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView()
    }
}
