//
//  Friend.swift
//  FriendsGiving
//
//  Created by Bob Witmer on 2023-08-13.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: String?
    var name: String = ""
    var bringing: String = ""
    var notes: String = ""

}
