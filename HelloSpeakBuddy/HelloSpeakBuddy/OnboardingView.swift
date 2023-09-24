//
//  Onboarding.swift
//  HelloSpeakBuddy
//
//  Created by Robihamanto on 2023/09/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                    Color(red: 213/255, green: 210/255, blue: 252/255),
                    Color(red: 244/255, green: 244/255, blue: 254/255),
                    Color.white
                ]),
                startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.system(size: 12, weight: .black))
                    .frame(width: 35, height: 35)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1),
                            radius: 2, x: 0, y: 2)
            }
            .padding(.trailing, 16)
            VStack {
                Spacer()
                Text("Hello\nSpeakBUDDY")
                    .font(FontManager.typography.titleFont)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                ZStack (alignment: .topLeading) {
                    Image("protty")
                        .resizable()
                        .scaledToFill()
                        .frame(width: getProttyImageSize(),
                               height: getProttyImageSize())
                    BarChart(data: getChardData(),
                             dataLabel: ["現在", "3ヶ月", "1年", "2年"],
                             maxHeight: min(DeviceHelper.screenHeight * 0.35,
                                            getChardData().last ?? 0))
                    .padding(.vertical, 32)
                }
                Text("スピークバディで")
                    .font(FontManager.typography.subtitleFont)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                LinearGradient(gradient: Gradient(colors: [
                            Color(red: 122/255, green: 196/255, blue: 250/255),
                            Color(red: 68/255, green: 140/255, blue: 247/255)
                        ]),
                    startPoint: .top,
                    endPoint: .bottom)
                .frame(height: 35)
                .mask(Text("レベルアップ")
                        .font(FontManager.typography.titleFont)
                        .fontWeight(.bold)
                        .foregroundColor(.white))
                .padding(.bottom, 24)
                Button(action: {
                    print("Button tapped!")
                }) {
                    Text("プランに登録する")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                }
                .frame(maxWidth: getSubmitButtonWidth())
                .background(Color(red: 91/255, green: 165/255, blue: 248/255))
                .cornerRadius(40)
                .shadow(color: Color.black.opacity(0.1),
                        radius: 2, x: 0, y: 2)
                .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 1))
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func getChardData() -> [CGFloat] {
        var cartData: [CGFloat] = [70, 110, 240, 340]
        if (DeviceHelper.isPhoneSE) {
            cartData = [70, 110, 200, 340]
        }
        return cartData
    }
    
    private func getProttyImageSize() -> Double {
        if DeviceHelper.isPad12 {
            return DeviceHelper.screenWidth * 0.185
        } else if DeviceHelper.isPad {
            return DeviceHelper.screenWidth * 0.225
        }
        return DeviceHelper.screenWidth * 0.35
    }
    
    private func getSubmitButtonWidth() -> Double {
        if DeviceHelper.isPad {
            return DeviceHelper.screenWidth * 0.55
        }
        return DeviceHelper.screenWidth
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct BarChart: View {
    
    let data: [CGFloat]
    let dataLabel: [String]
    let maxHeight: CGFloat
    
    @State private var isAnimating = false
    
    init(data: [CGFloat], dataLabel: [String], maxHeight: Double) {
        self.data = data
        self.dataLabel = dataLabel
        self.maxHeight = maxHeight
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 25) {
            ForEach(0..<data.count, id: \.self) { index in
                VStack {
                    VStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 2)
                            .fill(LinearGradient(gradient: Gradient(
                                    colors: [
                                        Color(red: 122/255, green: 196/255, blue: 250/255),
                                        Color(red: 68/255, green: 140/255, blue: 247/255)
                                    ]),
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                            .frame(width: 50, height: isAnimating ?  calculateBarHeight(for: data[index]) : 0)
                            .animation(.easeOut(duration: 1).delay(Double(index) * 0.1))
                    }
                    .frame(height: maxHeight)
                    Text(dataLabel[index])
                }
            }
        }
        .padding(.horizontal, 32)
        .onAppear {
            isAnimating = true
        }
    }
    
    private func calculateBarHeight(for value: CGFloat) -> CGFloat {
        let scaledHeight = (value / maxHeight) * maxHeight
        return min(scaledHeight, maxHeight) - 16
    }
    
}
