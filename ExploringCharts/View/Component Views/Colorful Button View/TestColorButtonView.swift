//
//  TestColorButtonView.swift
//  ExploringCharts
//
//  Created by karlis.stekels on 30/01/2023.
//

import SwiftUI

struct TestColorButtonView: View {
    
    @State var colors: [Color]
    var count: CGFloat {
        CGFloat(colors.count)
    }
    var barWidth: CGFloat {
        (UIScreen.main.bounds.width / count) - 5
    }
    
    let threshold = 30.0
    
    @State private var rotateBar: Bool = false
    @State private var tilt: CGFloat = 0.0
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .bottom, spacing: 3) {
                ForEach(colors, id: \.self) { color in
                    let height = Double.random(in: 50...200)
                    BorderedRectangle(color: color, barWidth: barWidth, height: height)
                }
            }
            .rotation3DEffect(.degrees(rotateBar ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(-tilt * 45), axis: (x: 0, y: 1, z: 0))
            .scaleEffect( tilt != 0 ? 0.8 : 1)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation {
                            if value.translation.width > threshold {
                                tilt = -1
                            } else if value.translation.width < -threshold {
                                tilt = 1
                            } else {
                                tilt = 0
                            }
                        }
                    }
            )
            .onTapGesture {
                tilt = 0
            }
        }
    }
}

struct BorderedRectangle: View {
    let color: Color
    let barWidth: CGFloat
    let height: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(color)
            .frame(width: barWidth, height: height)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 0.7)
            )
    }
}

struct TestColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TestColorButtonView(colors: Color.defaultColors)
    }
}
