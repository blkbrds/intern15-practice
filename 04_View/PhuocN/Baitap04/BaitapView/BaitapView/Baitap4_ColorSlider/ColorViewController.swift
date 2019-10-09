//
//  ColorViewController.swift
//  BaitapView
//
//  Created by PhuocNguyen on 10/6/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
  
  @IBOutlet weak var blueSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var colorView: UIView!
  @IBOutlet weak var colorLabel: UILabel!
  
  var redColor: CGFloat = 127 {
    didSet {
      changeValueColor()
    }
  }
  
  var greenColor: CGFloat = 127 {
    didSet {
      changeValueColor()
    }
  }
  var blueColor: CGFloat = 127 {
    didSet {
      changeValueColor()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setupUI() {
    changeValueColor()
    colorView.clipsToBounds = true
    colorView.layer.cornerRadius = 20
    redSlider.value = Float(redColor)
    greenSlider.value = Float(greenColor)
    blueSlider.value = Float(blueColor)
  }
  
  func changeValueColor() {
    self.colorView.backgroundColor = UIColor(displayP3Red: redColor/255, green: greenColor/255, blue: blueColor/255, alpha: 1)
    self.colorLabel.text = "Color( R: \(Int(redColor)), G: \(Int(greenColor)), B: \(Int(blueColor)))"
  }
  
  @IBAction func changeRedSlider(_ sender: Any) {
    redColor = CGFloat(redSlider.value)
  }
  
  @IBAction func changeBlueSlider(_ sender: Any) {
    blueColor = CGFloat(blueSlider.value)
  }
  
  @IBAction func changeGreenSlider(_ sender: Any) {
    greenColor = CGFloat(greenSlider.value)
  }
  
}
