//
//  ContentView.swift
//  Mage Squire
//
//  Created by Lucas Cardinali on 22/9/24.
//


import SwiftUI
import SwiftData

struct SDContentView: View {

    var body: some View {
        ZStack(alignment: .top) {
            // LinearGradient as the background
            Image("day")
                .resizable()
                .frame(height: 200)
                .scaledToFit()
                .ignoresSafeArea()

            // The List on top of the background
            List {
                ForEach(0..<10) { item in
                    Text("Item \(item)")
                }
            }
            .listRowBackground(Color.clear)
            .scrollContentBackground(.hidden) // Hides the default list background


            .background(Color.clear) // Makes sure List has a transparent background
        }
    }


}

#Preview {
    SDContentView()
}

