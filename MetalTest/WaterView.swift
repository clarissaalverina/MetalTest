//
//  WaterView.swift
//  MetalTest
//
//  Created by Clarissa Alverina on 20/06/24.
//

import SwiftUI

struct WaterView: View {
    @State private var start = Date.now
    @State private var moveToTop = false
    @State private var isFloating = false
    @State private var startFloating = false
    
    var body: some View {
        TimelineView(.animation) { tl in
            let time = start.distance(to: tl.date)
            ZStack {
                BackgroundImageView(imageName: "sea")
                BackgroundImageView(imageName: "waves")
                    .opacity(0.3)
                    .visualEffect { content, proxy in
                        content
                            .distortionEffect(
                                ShaderLibrary.wave(
                                    .float(time),
                                    .float2(proxy.size)
                                ),
                                maxSampleOffset: .zero
                            )
                    }
                
                    VStack {
                        Image("boat2")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding(.bottom, 250)
                            .offset(y: moveToTop ? -UIScreen.main.bounds.height / 10 : UIScreen.main.bounds.height / 8)
                            .offset(y: isFloating ? -5 : 5)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                                    isFloating.toggle()
                                }
                                if startFloating {
                                    withAnimation(.easeInOut(duration: 2)) {
                                        moveToTop.toggle()
                                    }
                                }
                            }
                    }
                
                Button("Move") {
                    withAnimation(.easeInOut(duration: 2)) {
                        moveToTop = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            isFloating.toggle()
                        }
                    }
                }
                .padding(.top, 500)
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 20))
                
            }
//            VStack {
//                TimelineView(.animation) { tl in
//                    let time = start.distance(to: tl.date)
//                    
//                    VStack {
//                        Rectangle()
//                            .visualEffect { content, proxy in
//                                content.colorEffect(
//                                    ShaderLibrary.wave(
//                                    .float2(proxy.size),
//                                    .float(time)
//                            ))
//                        }
//                    }
//                    .padding()
//                }
//            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundImageView: View {
    let imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    WaterView()
}
