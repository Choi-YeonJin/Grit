//
//  twoGradient.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/30.
//

import UIKit

class twoGradient: UIView {
    private var backgroundLayer : CAShapeLayer!
    private var foregroundLayer : CAShapeLayer!
    private var textLayer : CATextLayer!
    private var gradientLayer : CAGradientLayer!
    
    public var progress: CGFloat = 0{
        didSet {
            didProgressUpdated()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        guard layer.sublayers == nil else {
            return
        }
        
        let width = rect.width
        let height = rect.height
        
        let lineWidth = 0.1 * min(width, height)
        
        backgroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1.0).cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        
        backgroundLayer.shadowOpacity = 0.2
        
        foregroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor.red.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        
        foregroundLayer.strokeEnd = 0.2
        
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        gradientLayer.colors = [UIColor(red: 193/255, green: 146/255, blue: 162/255, alpha: 1.0).cgColor,UIColor(red: 240/255, green: 138/255, blue: 39/255, alpha: 1.0).cgColor ]
        
        gradientLayer.frame = rect
        gradientLayer.mask = foregroundLayer
        
        textLayer = createTextLayer(rect: rect, textColor: UIColor.black.cgColor)
        
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(gradientLayer)
//        layer.addSublayer(textLayer)
        
    }
    
    private func createCircularLayer(rect: CGRect, strokeColor: CGColor,
                                     fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {
        let width = rect.width
        let height = rect.height
        
        let lineWidth = 0.15 * min(width, height)
        
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = (min(width, height) - lineWidth) / 2
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = strokeColor
        shapeLayer.fillColor = fillColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round
        
        return shapeLayer
    }
    
    private func createTextLayer(rect : CGRect,textColor: CGColor) -> CATextLayer {
        let width = rect.width
        let height = rect.height
        
        let fontSize = min(width,height) / 4
        let offset = min(width,height) * 0.1
        
        let layer = CATextLayer()
        
        layer.string = "100"
        layer.backgroundColor = UIColor.clear.cgColor
        layer.foregroundColor = textColor
        layer.fontSize = fontSize
        layer.frame = CGRect(x: 0, y: (height - fontSize - offset) / 2, width: width, height: fontSize + offset)
        layer.alignmentMode = .center
        
        return layer
    }
    
    private func didProgressUpdated() {
        textLayer?.string = "\(Int(progress * 100))"
        foregroundLayer?.strokeEnd = progress
    }
}
