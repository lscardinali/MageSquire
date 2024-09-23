//
//  DummyPlayerSection.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftUI

struct DummyPlayerSection: View {

    @Binding var dummyPlayer: DummyPlayer
    @State var showLastTurn: Bool = false

    var body: some View {
        Section("Dummy Player") {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    VStack {
                        Text("\($dummyPlayer.deck.count)")
                            .font(.title)
                            .bold()
                        Text("Deck")
                    }
                    Spacer()
                    VStack {
                        Text("\($dummyPlayer.discarded.count)")
                            .font(.title)
                            .bold()
                        Text("Drawn")
                    }
                    Spacer()
                    Color.gray
                        .frame(width: 1)
                        .padding(.vertical, 10)
                    VStack {
                        HStack {
                            ForEach($dummyPlayer.crystals, id: \.self) { $crystal in
                                Image(systemName: "suit.diamond.fill")
                                    .foregroundStyle(crystal.color)
                            }
                        }
                        .padding(.bottom, 4)
                        Text("Mana Crystals")
                    }
                }
                Button("Draw cards for Turn") {
                    withAnimation {
                        dummyPlayer.drawForRound()
                    }

                    if dummyPlayer.deck.isEmpty {
                        showLastTurn = true
                    }
                }
                
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 8)

            }
        }
        .headerProminence(.increased)
        .alert("Important Message", isPresented: $showLastTurn) {
            Button("OK", role: .cancel) { }
            Button("Delete", role: .destructive) { }
        } message: {
            Text("Are you sure you want to delete this item?")
        }
    }
}

#Preview {
    List {
        DummyPlayerSection(
            dummyPlayer: Binding.constant(DummyPlayer(deck: [], discarded: [], crystals: [.fire, .fire, .fire])))
    }
}
