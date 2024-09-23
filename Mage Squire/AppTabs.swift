//
//  TabsView.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftUI

struct AppTabs: View {

    var body: some View {
        TabView {

            NavigationStack {
                MatchList()
            }
            .tabItem {
                Label("Matches", image: "Rook")
            }

            NavigationStack {
                Text("Combat WIP")
            }
            .tabItem {
                Label("Combat", image: "Swords")
            }

            NavigationStack {
                Text("Rules WIP")
            }
            .tabItem {
                Label("Rules", systemImage: "book.pages.fill")
            }

        }
    }
}

#Preview {
    AppTabs()
}
