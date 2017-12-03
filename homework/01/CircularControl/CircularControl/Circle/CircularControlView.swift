//
//  CircularControlView.swift
//  CircularControl
//
//  Created by Nikki Gyurova on 2.12.17.
//  Copyright © 2017 Nikki Gyurova. All rights reserved.
//

import UIKit

class CircularControlView: UIView {
    
    func degreesToRadians(degrees: CGFloat) -> CGFloat {
        return degrees * CGFloat(M_PI) / 180
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: 100, y: 100),
            bigCircle = UIBezierPath(),
            grayCircle = UIBezierPath()
        
        //aPath.move(to: CGPoint(x:0, y:100))
        
        //aPath.addLine(to: CGPoint(x:100, y:100))
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        //aPath.close()
        
        //If you want to stroke it with a red color
        //UIColor.blue.set()
        //aPath.stroke()
        //If you want to fill it as well
        //aPath.fill()
        
        bigCircle.addArc(withCenter: center, radius: 100, startAngle: 0, endAngle: 360, clockwise: true)
        UIColor.blue.set()
        bigCircle.fill()
        
        grayCircle.addArc(withCenter: center, radius: 95, startAngle: 0, endAngle: 360, clockwise: true)
        UIColor.gray.set()
        grayCircle.fill()
        
        let whiteBackground = UIBezierPath()
        whiteBackground.addArc(withCenter: center, radius: 90, startAngle: 0, endAngle: 360, clockwise: true)
        UIColor.white.set()
        whiteBackground.fill()
        
        let colors: [UIColor] = [.red, .green, .purple, .magenta, .cyan],
            startFrom = 160,
            segment = 45

        for i in 0...4 {
            let scale = UIBezierPath(),
            start = degreesToRadians(degrees: CGFloat(startFrom + (i * segment))),
            end = degreesToRadians(degrees: CGFloat(startFrom + (i * segment) + segment))
            
            scale.addArc(withCenter: center, radius: 75, startAngle: start, endAngle:end, clockwise: true)
            scale.lineWidth = 20
            colors[i].set()
            scale.stroke()
            let dashPattern : [CGFloat] = [0, 16]
            scale.setLineDash(dashPattern, count: 2, phase: 0)
            UIColor.gray.set()
            scale.stroke()
        }
        
        let arrow = UIBezierPath()
        UIColor.blue.set()
        arrow.addArc(withCenter: center, radius: 10, startAngle: 0, endAngle: degreesToRadians(degrees: 360), clockwise: true)
        arrow.fill()
        arrow.move(to: center)
        arrow.addLine(to: CGPoint(x: 100, y: 25))
        arrow.stroke()
    }

}
