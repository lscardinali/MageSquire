//
//  ManaDice.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//

import SwiftUI


struct ManaDiceItem: View {

    @Binding var dice: ManaDice

    var body: some View {
        ZStack {
            Color.gray
            Image(dice.type.imageName)
                .resizable()
                .padding(8)
        }
        .onTapGesture {
            print("reroll")
                dice.reroll()

        }
        .frame(width: 42, height: 42)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    ManaDiceItem(dice: Binding.constant(ManaDice(type: .air)))
}
