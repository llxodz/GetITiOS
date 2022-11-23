//
//  RadarView.swift
//  GetITiOS
//
//  Created by Ilya Gavrilov on 22.11.2022.
//

import UIKit

private enum Constants {
    static let lineWidth: CGFloat = 1
    static let planeImageString: String = "Plane"
}

final class RadarView: UIView {
    
    private let radarSettings: RadarSettings
    
    // MARK: - Init
    
    init(countCircles: Int, countPlanes: Int) {
        self.radarSettings = RadarSettings(cicles: countCircles, countPlanes: countPlanes)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let radius = (rect.width / 2) / CGFloat(radarSettings.cicles)
        
        /// Drawing radar lines & adding planes
        drawCircles(radius: radius, rect: rect)
        setPlanesInCircles(radius: radius, rect: rect, context: context)
    }
    
    // MARK: - Private
    
    private func drawCircles(radius: CGFloat, rect: CGRect) {
        UIColor.black.setStroke()
        for i in 1...radarSettings.cicles {
            let circle = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY),
                                      radius: (CGFloat(i) * radius) - (Constants.lineWidth / 2),
                                      startAngle: 0,
                                      endAngle: 2 * CGFloat.pi,
                                      clockwise: true
            )
            circle.lineWidth = Constants.lineWidth
            circle.stroke()
        }
    }
    
    private func setPlanesInCircles(radius: CGFloat, rect: CGRect, context: CGContext) {
        guard let image = UIImage(named: Constants.planeImageString)?.cgImage else { return }
        
        radarSettings.planes.forEach { plane in
            let centerX = rect.midX - (radius / 2)
            let centerY = rect.midY - (radius / 2)
            let pointX = (CGFloat(plane.level) - 0.5) * radius * cos(plane.angle)
            let pointY = (CGFloat(plane.level) - 0.5) * radius * sin(plane.angle)
            
            context.draw(image, in: CGRect(x: centerX + pointX,
                                           y: centerY + pointY,
                                           width: radius - Constants.lineWidth,
                                           height: radius - Constants.lineWidth)
            )
        }
    }
}
