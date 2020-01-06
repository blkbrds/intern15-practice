//
//  CustomView.swift
//  BaiTap05
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

protocol CustomViewDelegate: class {
  func receivedResultValue(view: CustomView, result: Float?)
}

protocol CustomViewDataSource: class {
  func valueForCalculator(forView: CustomView) -> (x: Int, y: Int)
}

class CustomView: UIView {

  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var xLabel: UILabel!
  @IBOutlet weak var yLabel: UILabel!

  private var x: Int?
  private var y: Int?
  private var result: Float = 0.0

  weak var delegate: CustomViewDelegate?
  weak var datasource: CustomViewDataSource? {
    didSet {
      setupDatasource()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  private func setupDatasource() {
    resultLabel.text = "\(0)"
    guard let x = datasource?.valueForCalculator(forView: self).x,
      let y = datasource?.valueForCalculator(forView: self).y else {
        return
    }
    self.x = x; self.y = y
    xLabel?.text = "\(x)"
    yLabel?.text = "\(y)"
  }

  private func hidenView() {
    UIView.animate(withDuration: 2) {
      self.isHidden = true
    }
  }
  
  private func formatResultAndShow(){
    let resultStr = String(format: "%.2f", result)
    resultLabel.text = "\(resultStr)"
    self.result = Float(resultStr)!
  }

  @IBAction func doneButton(_ sender: Any) {
    delegate?.receivedResultValue(view: self, result: result)
    hidenView()
  }

  @IBAction func cancelButton(_ sender: Any) {
    hidenView()
  }

  @IBAction func clearButton(_ sender: Any) {
    xLabel.text = "0"
    yLabel.text = "0"
    resultLabel.text = "0.0"
  }

  @IBAction func x_yButton(_ sender: Any) {
    guard let x = self.x, let y = self.y else {
      return
    }
    result = powf(Float(x), Float(y))
    formatResultAndShow()
  }

  @IBAction func percentButton(_ sender: Any) {
    guard let x = self.x, let y = self.y else {
      return
    }
    result = Float(x % y)
    formatResultAndShow()
  }

  @IBAction func divButton(_ sender: Any) {
    guard let x = self.x, let y = self.y else {
      return
    }
    result = Float(x) / Float(y)
    formatResultAndShow()
  }

  @IBAction func mulButton(_ sender: Any) {
    guard let x = self.x, let y = self.y else {
      return
    }
    result = Float(x * y)
    formatResultAndShow()
  }

  @IBAction func subButton(_ sender: Any) {
    guard let x = self.x, let y = self.y else {
      return
    }
    result = Float(x - y)
    formatResultAndShow()
  }

  @IBAction func plusButton(_ sender: Any) {
    guard let x = self.x, let y = self.y else {
      return
    }
    result = Float(x + y)
    formatResultAndShow()
  }
}
