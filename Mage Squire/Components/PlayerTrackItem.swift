//
//  PlayerTrackItem.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftUI

struct PlayerTrackItem: View {
    @Binding var value: Int

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle.badge.checkmark")
                Text("Tovak")
            }
            .padding(.bottom, 8)
            HStack {
                Spacer()
                VStack {
                    Text("Reputation")
                        .font(.caption)
                    Text("\(value)")
                        .font(.title)
                        .bold()
                        .padding(.bottom, -6)
                    Stepper("", value: $value)
                        .labelsHidden()
                }
                Spacer()
                VStack {
                    Text("Reputation")
                        .font(.caption)
                    Text("\(value)")
                        .font(.title)
                        .bold()
                        .padding(.bottom, -6)

                    Stepper("", value: $value)
                        .labelsHidden()
                }
                Spacer()
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PlayerTrackItem(value: Binding.constant(10))
}
