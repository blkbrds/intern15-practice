//
//  ChartView.swift
//  baiTapDrawing(2)
//
//  Created by ADMIN on 4/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
class ChartView: UIView {
    var xStart = 60
    var yStart = 325
    let verticalValue: [String] = ["300","250","200","150","100","50","0"]
    let horizontalValue: [String] = ["Thảo", "Nam", "An", "Lan", "Đức", "Long", "Mai","Huy","Sơn"]
    func draw() {
        var point: Int = 350
        let line: Int = 6
        for _ in 0...line {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: point))
        path.addLine(to: CGPoint(x: 500, y: point))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
         point += 50
        }
        
    let chart1View = UIView(frame: CGRect(x: 60, y: 650, width: 20, height: -270))
    chart1View.backgroundColor = .systemBlue
    self.addSubview(chart1View)
        
    let chart2View = UIView(frame: CGRect(x: 100, y: 650, width: 20, height: -170))
    chart2View.backgroundColor = .systemBlue
    self.addSubview(chart2View)
        
    let chart3View = UIView(frame: CGRect(x: 140, y: 650, width: 20, height: -140))
    chart3View.backgroundColor = .systemBlue
    self.addSubview(chart3View)
        
    let rectView3 = UIView(frame: CGRect(x: 180, y: 650, width: 20, height: -125))
    rectView3.backgroundColor = .systemBlue
    self.addSubview(rectView3)
        
    let chart4View = UIView(frame: CGRect(x: 220, y: 650, width: 20, height: -90))
    chart4View.backgroundColor = .systemBlue
    self.addSubview(chart4View)
        
    let chart5View = UIView(frame: CGRect(x: 260, y: 650, width: 20, height: -80))
    chart5View.backgroundColor = .systemBlue
    self.addSubview(chart5View)
        
    let chart6View = UIView(frame: CGRect(x: 300, y: 650, width: 20, height: -40))
    chart6View.backgroundColor = .systemBlue
    self.addSubview(chart6View)
        
    let chart7View = UIView(frame: CGRect(x: 340, y: 650, width: 20, height: -20))
    chart7View.backgroundColor = .systemBlue
    self.addSubview(chart7View)
        
    let chart8View = UIView(frame: CGRect(x: 380, y: 650, width: 20, height: -10))
    chart8View.backgroundColor = .systemBlue
    self.addSubview(chart8View)
    }
    
    func labelView() {
        for i in 0...8 {
        let yColurmLabel: UILabel = UILabel(frame: CGRect(x: xStart, y: 650, width: 40, height: 50))
        yColurmLabel.text = String(horizontalValue[i])
        xStart += 40
            self.addSubview(yColurmLabel)
        }
        for i in 0...6 {
        let xColurmLabel: UILabel = UILabel(frame: CGRect(x: 10, y: yStart, width: 40, height: 50))
        xColurmLabel.text = String(verticalValue[i])
        yStart += 50
            self.addSubview(xColurmLabel)
        }
    }
}

