//
//  MatchScreen.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftUI

struct MatchScreen: View {

    @Environment(\.modelContext) private var modelContext
    @Bindable var match: Match

    var body: some View {
        ZStack(alignment: .top) {
            Image("daymasked")
                .resizable()
                .ignoresSafeArea()
                .frame(height: 100)


            List {

                Section("Players") {
                    PlayerTrackItem(value: $match.reputation)
                    PlayerTrackItem(value: $match.reputation)
                }
                .headerProminence(.increased)

                Section(
                    header: HStack {
                        Text("Mana Pool")
                        Spacer()

                        Button {

                        } label: {
                            Image(systemName: "ellipsis")
                        }

                    }
                ) {
                    HStack {
                        ForEach($match.dices) { $dice in
                            ManaDiceItem(dice: $dice)
                        }
                        Spacer()
                        Color.gray
                            .frame(width: 1, height: 16)
                        //ManaDiceItem(dice: .light)

                    }
                    .padding(.vertical, 2)
                }
                .headerProminence(.increased)

                Section("Movement Costs") {
                    HStack(alignment: .top) {
                        Spacer()
                        VStack(alignment: .leading) {
                            MovementCostItem(color: Color.green, name: "Plains", cost: "3")
                            MovementCostItem(
                                color: Color.green, name: "Forest", cost: "3", nightCost: "5", isNight: false)
                            MovementCostItem(
                                color: Color.yellow, name: "Desert", cost: "5", nightCost: "3", isNight: false)
                            MovementCostItem(color: Color.blue, name: "Lake", cost: "-")
                            MovementCostItem(color: Color.primary, name: "Exploring", cost: "2")
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            MovementCostItem(color: Color.orange, name: "Hills", cost: "3")
                            MovementCostItem(color: Color.brown, name: "Wasteland", cost: "4")
                            MovementCostItem(color: Color.brown, name: "Swamp", cost: "5")
                            MovementCostItem(color: Color.gray, name: "Mountain", cost: "-")
                            MovementCostItem(color: Color.gray, name: "City", cost: "2")

                        }
                        Spacer()
                    }
                }
                .headerProminence(.increased)

                DummyPlayerSection(dummyPlayer: $match.dummyPlayer)

            }
            .scrollContentBackground(.hidden) // Hides the default list background


        }
        .navigationTitle("Round 1, Night")
    }
}

#Preview {
    NavigationStack {
        MatchScreen(match: Match(timestamp: Date()))
    }
}
