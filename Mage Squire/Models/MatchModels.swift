//
//  MatchModels.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import Foundation
import SwiftData
import SwiftUI

enum CardType: CaseIterable, Codable {
    case water, fire, air, earth
}

extension CardType {

    var color: Color {
        switch self {
        case .water:
            return .blue
        case .air:
            return .white
        case .earth:
            return .green
        case .fire:
            return .red
        }
    }
}

enum ManaDiceType: CaseIterable, Codable {
    case water, fire, air, earth, light, dark
}

extension ManaDiceType {

    var imageName: String {
        switch self {
        case .water:
            return "Water-Mana"
        case .air:
            return "Air-Mana"
        case .earth:
            return "Earth-Mana"
        case .fire:
            return "Fire-Mana"
        case .light:
            return "Light-Mana"
        case .dark:
            return "Dark-Mana"
        }
    }
}

@Model
final class ManaDice: Identifiable {

    var id: UUID

    var type: ManaDiceType

    init(type: ManaDiceType = .air) {
        self.id = UUID()
        self.type = type
    }

    static func random() -> ManaDice {
        let dice = ManaDice()
        dice.reroll()
        return dice
    }

    func reroll() {

        type = ManaDiceType.allCases.randomElement() ?? .air
        print(type)
    }
}

enum TimeOfDay {
    case day, night
}

enum MageKnightCharacter: String, CaseIterable, Identifiable {
    case tovak, norowas, arythea, goldyx, wolfhawk, krang, braevalar
    var id: Self { self }
}

@Model
final class DummyPlayer {

    var deck: [CardType]
    var discarded: [CardType]
    var crystals: [CardType]

    init(deck: [CardType], discarded: [CardType], crystals: [CardType]) {
        self.deck = deck
        self.discarded = discarded
        self.crystals = crystals
    }

    func drawForRound() {
        var drawnNumber = 3
        if deck.count < 3 {
            drawnNumber = deck.count
        }
        let drawnCards = deck.prefix(drawnNumber)
        discarded.append(contentsOf: drawnCards)
        deck.removeFirst(drawnNumber)
    }

    static func arythea() -> DummyPlayer {
        .init(deck: [.air, .fire, .water, .earth], discarded: [], crystals: [.fire, .fire, .fire])
    }

}

@Model
final class Match {
    var timestamp: Date

    var reputation: Int = 0

    var dummyPlayer: DummyPlayer
    var dices: [ManaDice] = []

    init(timestamp: Date) {
        self.timestamp = timestamp
        self.dummyPlayer = DummyPlayer.arythea()
        dices.append(ManaDice.random())
        dices.append(ManaDice.random())
    }
}
