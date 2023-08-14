//
//  FriendsViewModel.swift
//  FriendsGiving
//
//  Created by Bob Witmer on 2023-08-13.
//

import Foundation

class FriendsViewModel: ObservableObject {
    @Published var friends: [Friend] = []
    let fileName = "friends"
    
    init() {
        loadData()
    }
    
    func saveFriend(friend: Friend) {
        if friend.id == nil {   // This is a new friend to append, create an ID
            var newFriend = friend
            newFriend.id = UUID().uuidString
            friends.append(newFriend)
        } else {    // This is an existing friend to edit, need to find the index to update
            if let index = friends.first(where: {$0.id == friend.id}) {
//TODO: Fix this error 'No exact matches in call to subscript'
//                                friends[index] = friend
                print(index)    //Debugging and suppressing error of not using 'index'

            }
        }
        saveData()
    }
    
    func deleteFriend(atOffsets: IndexSet) {
        friends.remove(atOffsets: atOffsets)
        saveData()
    }
    
    func moveFriend(fromOffsets: IndexSet, toOffset: Int) {
        friends.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    private func loadData() {
        let path = URL.documentsDirectory.appending(component: fileName)
        guard let data = try? Data(contentsOf: path) else {
            print("😡 ERROR: Could not load data from path: \(path)")
            return
        }
        do {
            friends = try JSONDecoder().decode([Friend].self, from: data)
        } catch {
            print("😡 ERROR: Could not decode data!")
        }
    }
    
    private func saveData() {
        let path = URL.documentsDirectory.appending(component: fileName)
        let data = try? JSONEncoder().encode(friends)
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data!")
        }
    }

}
