//
//  ContentView.swift
//  MetalTest
//
//  Created by Clarissa Alverina on 20/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var start = Date.now
    
    var body: some View {
        TimelineView(.animation) { tl in
            let time = start.distance(to: tl.date)
            
            VStack {
                Image(systemName: "rainbow")
                    .imageScale(.large)
                    .foregroundStyle(.white)
                    .font(.system(size: 100))
                    .colorEffect(
                        ShaderLibrary.rainbow(
                            .float(time)
                        )
                    )
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
