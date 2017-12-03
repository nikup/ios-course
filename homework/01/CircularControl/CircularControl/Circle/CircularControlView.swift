//
//  CircularControlView.swift
//  CircularControl
//
//  Created by Nikki Gyurova on 2.12.17.
//  Copyright © 2017 Nikki Gyurova. All rights reserved.
//

import UIKit
@IBDesignable class CircularControlView: UIView {
    var colors: [UIColor] = [.red, .green, .purple, .magenta, .cyan]
    var circleCenter: CGPoint = CGPoint(x: 0, y:0)
    var radius: CGFloat = 100
    
    func degreesToRadians(degrees: CGFloat) -> CGFloat {
        return degrees * CGFloat(Double.pi) / 180
    }
    
    func drawBackground() -> Void {
        let endAngle = CGFloat(2*Double.pi),
            bigCircle = UIBezierPath()
        bigCircle.addArc(withCenter: circleCenter, radius: radius, startAngle: 0, endAngle: endAngle, clockwise: true)
        UIColor.blue.set()
        bigCircle.fill()

        let grayCircle = UIBezierPath()
        grayCircle.addArc(withCenter: circleCenter, radius: (radius-5), startAngle: 0, endAngle: endAngle, clockwise: true)
        UIColor.gray.set()
        grayCircle.fill()
        
        let whiteBackground = UIBezierPath()
        whiteBackground.addArc(withCenter: circleCenter, radius: (radius-10), startAngle: 0, endAngle: endAngle, clockwise: true)
        UIColor.white.set()
        whiteBackground.fill()
    }
    
    func drawScale() -> Void {
        let startFrom = 160,
            segment = 45
        
        for i in 0...4 {
            let scale = UIBezierPath(),
            start = degreesToRadians(degrees: CGFloat(startFrom + (i * segment))),
            end = degreesToRadians(degrees: CGFloat(startFrom + (i * segment) + segment))
            
            scale.addArc(withCenter: circleCenter, radius: (radius-25), startAngle: start, endAngle:end, clockwise: true)
            scale.lineWidth = 20
            colors[i].set()
            scale.stroke()
            let dashPattern : [CGFloat] = [0, 16]
            scale.setLineDash(dashPattern, count: 2, phase: 0)
            UIColor.gray.set()
            scale.stroke()
        }
    }
    
    func drawArrow() -> Void {
        let arrow = UIBezierPath()

        UIColor.blue.set()
        arrow.addArc(withCenter: circleCenter, radius: 10, startAngle: 0, endAngle: degreesToRadians(degrees: 360), clockwise: true)
        arrow.fill()
        arrow.move(to: circleCenter)
        arrow.addLine(to: CGPoint(x: circleCenter.x, y: circleCenter.y - (radius - 25)))
        arrow.stroke()
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        circleCenter = CGPoint(x: rect.midX, y: rect.midY)
        radius = min(rect.width, rect.height) / 2 - 10
        
        drawBackground()
        drawScale()
        drawArrow()
    }

}
