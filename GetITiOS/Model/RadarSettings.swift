//
//  RadarSettings.swift
//  GetITiOS
//
//  Created by Ilya Gavrilov on 22.11.2022.
//

import Foundation

struct RadarSettings {
    let cicles: Int
    let planes: [Plane]
    
    init(cicles: Int, countPlanes: Int) {
        self.cicles = cicles
        var calcPlanes: [Plane] = []
        for _ in 0..<countPlanes {
            calcPlanes.append(Plane(level: Int.random(in: 1...cicles), angle: CGFloat.random(in: 0...CGFloat.pi*2)))
        }
        self.planes = calcPlanes
    }
}

struct Plane {
    let level: Int
    let angle: CGFloat
}
