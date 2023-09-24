//
//  ContentView.swift
//  HelloSpeakBuddy
//
//  Created by Robihamanto on 2023/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showOnboarding = false
    
    var body: some View {
        VStack {
            Image("protty")
                .resizable()
                .scaledToFill()
                .frame(
                    width: DeviceHelper.screenWidth * 0.5,
                    height: DeviceHelper.screenWidth * 0.5)
                .padding(.bottom, 64)
            Button("Show Onboarding") {
                showOnboarding = true
            }
            .padding(.bottom, 16)
            .fullScreenCover(isPresented: $showOnboarding) {
            }
            Text("Tap the above button to show the onboarding screen and close it to restart the animation")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
