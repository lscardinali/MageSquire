//
//  MovementCostItem.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftUI

struct MovementCostItem: View {

    let color: Color
    let name: String
    let cost: String
    let nightCost: String?
    let isNight: Bool?

    init(color: Color, name: String, cost: String, nightCost: String? = nil, isNight: Bool? = nil) {
        self.color = color
        self.name = name
        self.cost = cost
        self.nightCost = nightCost
        self.isNight = isNight
    }

    var body: some View {
        HStack {
            ZStack {
                Image(systemName: name == "Exploring" ? "chevron.compact.up.chevron.compact.right.chevron.compact.down.chevron.compact.left" : "hexagon")
                    .resizable()
                    .foregroundStyle(color)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                Text(isNight ?? false ? nightCost ?? "" : cost)
                    .font(.title2)
                    .bold()
            }
            Text(name)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MovementCostItem(color: Color.red, name: "Plains", cost: "5", nightCost: "3", isNight: false)
    MovementCostItem(color: Color.blue, name: "Night", cost: "5", nightCost: "3", isNight: true)
}
