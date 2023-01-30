//
//  RandomArcFromColorListView.swift
//  ExploringCharts
//
//  Created by karlis.stekels on 30/01/2023.
//

import SwiftUI

struct RandomArcFromColorListView: View {
    // Params
    let colors: [Color]
    let index: Int
    let minRadius: CGFloat
    let maxRadius: CGFloat
    let opacity: CGFloat
    
    // Random constant
    let startTrim = Double.random(in: 0...0.5)
//    let endTrim = Double.random(in: 0.6...1)
    let endTrim = 1.0
    
    // Computed Props
    var theIndex: Int {
        return index < colors.count && index >= 0 ? index : 0
    }
    var count: CGFloat {
       return CGFloat(colors.count)
    }
    var color: Color {
        colors[index]
    }
    var endRadius: CGFloat {
        minRadius + maxRadius / count
    }
    var rotate: CGFloat {
        Double.random(in: 0...360)
    }
    
    var body: some View {
        ArcView(
            color: color.opacity(opacity),
            startRadius: minRadius,
            endRadius: endRadius,
            startTrim: startTrim,
            endTrim: endTrim,
            rotate: rotate
        )
    }
}

struct RandomArcFromColorListView_Previews: PreviewProvider {
    static var previews: some View {
        RandomArcFromColorListView(
            colors: Color.defaultColors,
            index: 0,
            minRadius: 170,
            maxRadius: 180,
            opacity: 0.9
        )
    }
}
