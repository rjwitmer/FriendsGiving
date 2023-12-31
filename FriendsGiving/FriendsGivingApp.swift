//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by Bob Witmer on 2023-08-13.
//

import SwiftUI

@main
struct FriendsGivingApp: App {
    @StateObject var friendsVM = FriendsViewModel()
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(friendsVM)
        }
    }
}
