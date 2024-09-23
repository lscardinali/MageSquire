//
//  MatchList.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftData
import SwiftUI

struct MatchList: View {
    @Query private var matches: [Match]
    @Environment(\.modelContext) private var modelContext


    @State private var showingCreateMatchSheet = false

    var body: some View {
        List {
            ForEach(matches) { match in
                NavigationLink {
                    MatchScreen(match: match)
                } label: {
                    Text(match.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                }
            }
            .onDelete(perform: deleteItems)
        }
        .sheet(isPresented: $showingCreateMatchSheet) {
            NewMatchModal()
        }
        .navigationTitle("Matches")
        .toolbar {
            Button("New Match") {
                showingCreateMatchSheet = true
            }
        }
    }


    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(matches[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        MatchList()
    }
    .modelContainer(for: Match.self, inMemory: true)
}
