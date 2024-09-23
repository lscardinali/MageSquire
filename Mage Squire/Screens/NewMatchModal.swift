//
//  SwiftUIView.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftUI

struct NewMatchModal: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State var selectedCharacter: MageKnightCharacter = .arythea

    @State var players: [String] = []

    @State var useManaPool: Bool = true
    @State var useDummyPlayer: Bool = true

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button {
                        withAnimation {
                            players.append("Tovak")
                        }
                    } label: {
                        HStack {
                            Image(systemName: "person.crop.circle.badge.plus")
                            Text("Add Player")
                        }
                    }
                    ForEach(players, id: \.self) { player in
                        Picker("Character", selection: $selectedCharacter) {
                            ForEach(MageKnightCharacter.allCases) { character in
                                HStack {
                                    Image(systemName: "circle")
                                    Text(character.rawValue.capitalized)
                                }
                            }
                        }

                    }
                } header: {
                    Text("Players")
                } footer: {
                    players.count == 0 ? Text("Add at least one player to start") : nil
                }

                Section("Options") {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Mana Pool")
                            Text("Tracks the mana dice rolling")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Toggle("", isOn: $useManaPool)
                            .labelsHidden()
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Movement Costs")
                            Text("Show movement costs dynamically")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Toggle("", isOn: $useManaPool)
                            .labelsHidden()
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Dummy Player")
                            Text("Show movement costs dynamically")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Toggle("", isOn: $useDummyPlayer)
                            .labelsHidden()
                    }
                }

                if useDummyPlayer {
                    Section("Dummy Player Options") {

                    }
                }
            }
            .toolbar {
                Button("Create Match") {
                    withAnimation {
                        let newMatch = Match(timestamp: Date())
                        modelContext.insert(newMatch)
                        dismiss()
                    }
                }
                .disabled(players.count == 0)
            }
        }

    }
}

#Preview {
    NewMatchModal()
        .modelContainer(for: Match.self, inMemory: true)
}
