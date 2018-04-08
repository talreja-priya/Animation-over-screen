//
//  Animation.swift
//  AnimationExample
//
//  Created by Priya Talreja on 08/04/18.
//  Copyright © 2018 Priya Talreja. All rights reserved.
//

import UIKit
import QuartzCore


class Animation: UIView {
    var caEmitter: CAEmitterLayer!
    public var imageColors: [UIColor]!
    public var imageName: String!
    public var birthRate: Float!
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultSetup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetup()
    }
    
    func defaultSetup()
    {
        imageColors = [
            UIColor(red: (255.0/255.0), green: (202.0/255), blue: (233.0/255.0), alpha: 1.0),
            UIColor(red: (252.0/255.0), green: (61.0/255), blue: (112.0/255.0), alpha: 1.0),
            UIColor(red: (137.0/255.0), green: (33.0/255), blue: (177.0/255.0), alpha: 1.0),
            UIColor(red: (130.0/255.0), green: (32.0/255), blue: (74.0/255.0), alpha: 1.0),
            UIColor(red: (64.0/255.0), green: (121.0/255), blue: (140.0/255.0), alpha: 1.0),
            UIColor(red: (64.0/255.0), green: (121.0/255), blue: (140.0/255.0), alpha: 1.0)]
        birthRate = 2.0
        
    }
    
    
    func imagesWithColors(color: UIColor) -> CAEmitterCell {
        let imageCell = CAEmitterCell()
        imageCell.contents = UIImage.init(named: imageName)!.cgImage
        imageCell.scale = 0.6
        imageCell.birthRate = birthRate
        imageCell.lifetime = 14.0
        imageCell.lifetimeRange = 0
        imageCell.color = color.cgColor
        imageCell.velocity = CGFloat(200.0)
        imageCell.velocityRange = CGFloat(100.0)
        imageCell.emissionLongitude = CGFloat(Double.pi)
        imageCell.emissionRange = CGFloat(Double.pi/4)
        imageCell.spin = CGFloat(2.5)
        imageCell.spinRange = CGFloat(4.0)
        imageCell.scaleRange = CGFloat(0.3)
        imageCell.scaleSpeed = CGFloat(-0.1)
        return imageCell
    }
    
    
    public func startAnimation() {
        caEmitter = CAEmitterLayer()
        
        caEmitter.emitterPosition = CGPoint(x: frame.size.width / 2.0, y: 0)
        caEmitter.emitterShape = kCAEmitterLayerLine
        caEmitter.emitterSize = CGSize(width: frame.size.width, height: 1)
        
        var cells = [CAEmitterCell]()
        for color in imageColors {
            cells.append(imagesWithColors(color: color))
        }
        caEmitter.emitterCells = cells
        layer.addSublayer(caEmitter)
        
    }
    
    public func stopAnimation() {
        caEmitter?.birthRate = 0
    }
}

extension UIColor {
    open class func randomColor() -> UIColor {
        srandom(arc4random())
        var red:Float = 0.0
        while (red < 0.1 || red > 0.84) {
            red = Float(drand48())
        }
        var green:Float = 0.0
        while (green < 0.1 || green > 0.84) {
            green = Float(drand48())
        }
        var blue:Float = 0.0
        while (blue < 0.1 || blue > 0.84) {
            blue = Float(drand48())
        }
        return UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    open class func colorHash(name: String?) -> UIColor {
        if let n = name {
            var nameValue = 0
            for c in n {
                let characterString = String(c)
                let scalars = characterString.unicodeScalars
                nameValue +=  Int(scalars[scalars.startIndex].value)
            }
            var r = Float((nameValue * 123) % 51) / 51.0
            var g = Float((nameValue * 321) % 73) / 73.0
            var b = Float((nameValue * 213) % 91) / 91.0
            r = min(max(r, 0.1), 0.84)
            g = min(max(g, 0.1), 0.84)
            b = min(max(b, 0.1), 0.84)
            
            return UIColor.init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
        }
        else {
            return UIColor.red
        }
    }
}
