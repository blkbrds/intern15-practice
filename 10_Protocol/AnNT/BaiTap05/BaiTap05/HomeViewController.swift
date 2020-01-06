//
//  HomeViewController.swift
//  BaiTap05
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var numberATextField: UITextField!
  @IBOutlet weak var numberBTextField: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  
  var customView: CustomView!

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    loadNibView()
  }

  private func loadNibView() {
    customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView
    customView.frame = CGRect(x: view.bounds.width / 2 - 200, y: view.bounds.height / 2 - 150, width: 400, height: 300)
    customView.delegate = self
    customView.isHidden = true
    view.addSubview(customView)
  }

  @IBAction func calculatorButton(_ sender: Any) {
    customView.datasource = self
    UIView.animate(withDuration: 1.5) {
      self.customView.isHidden = false
    }
  }
}

extension HomeViewController: CustomViewDelegate {
  func receivedResultValue(view: CustomView, result: Float?) {
    resultLabel.text = "= \(result ?? 0)"
  }
}


extension HomeViewController: CustomViewDataSource {
  func valueForCalculator(forView: CustomView) -> (x: Int, y: Int) {
    guard let a = Int(numberATextField.text ?? ""), let b = Int(numberBTextField.text ?? "") else {
      return (0, 0)
    }
    print(a)
    return (a, b)
  }
}
