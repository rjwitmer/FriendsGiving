//
//  ListView.swift
//  FriendsGiving
//
//  Created by Bob Witmer on 2023-08-13.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var friendsVM: FriendsViewModel
    @State private var sheetIsPresented = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(friendsVM.friends) { friend in
                    NavigationLink {
                        DetailView(friend: friend)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .font(.title2)
                            Text(friend.bringing)
                                .font(.callout)
                        }
                    }
                }
                .onDelete(perform: friendsVM.deleteFriend)
                .onMove(perform: friendsVM.moveFriend)

            }
            .listStyle(.plain)
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
        .sheet(isPresented: $sheetIsPresented) {
            NavigationStack {
                DetailView(friend: Friend())
            }
        }
        .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(FriendsViewModel())
    }
}
