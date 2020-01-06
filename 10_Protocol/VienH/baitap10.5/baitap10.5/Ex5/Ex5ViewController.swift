//
//  Ex5ViewController.swift
//  baitap10.5
//
//  Created by user on 12/17/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class Ex5ViewController: BaseViewController {

    @IBOutlet weak var xTextfield: UITextField!


    @IBOutlet weak var yTextfield: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!

    private var customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView
    private var customViewHeight: CGFloat = 300

    // MARK: - Override function
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupUI() {
        super.setupUI()
        self.title = "Calculation"
        if let customView = customView {
            let frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: customViewHeight)
            customView.frame = frame
            customView.delegate = self
            customView.dataSource = self
            view.addSubview(customView)
        }
    }

    @IBAction func clickToCalculate(_ sender: UIButton) {
        view.endEditing(true)
                yTextfield.resignFirstResponder()
                slideUp()
            }

            private func slideUp() {
                customView?.reloadData()
                UIView.animate(withDuration: 1) {
                    let frame = CGRect(x: 0, y: self.view.bounds.height - self.customViewHeight, width: self.view.bounds.width, height: self.customViewHeight)
                    self.customView?.frame = frame
                }
            }

            private func slideDown() {
                UIView.animate(withDuration: 1) {
                    let frame = CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: self.customViewHeight)
                    self.customView?.frame = frame
                }
            }
        }

        extension Ex5ViewController: CustomViewDataSource, CustomViewDelegate {
            func sendResult(view: CustomView, needsPerfrom action: CustomView.Action) {
                switch action {
                case .sendResult(let result):
                    resultLabel.text = "\(result)"
                case .clear:
                    xTextfield.text = ""
                    yTextfield.text = ""
                    resultLabel.text = ""
                case .cancel:
                    break
                }
                slideDown()
            }

            func getValues() -> (x: Int, y: Int) {
                guard let first = xTextfield.text, let x = Int(first), let second = yTextfield.text, let y = Int(second) else { return(x: 0, y: 0) }
                return (x: x, y: y)
            }
        }
