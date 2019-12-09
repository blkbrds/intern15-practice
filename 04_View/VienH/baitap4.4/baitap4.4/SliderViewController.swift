//
//  SliderViewController.swift
//  baitap4.4
//
//  Created by user on 11/14/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var boardCoLorLabel: UILabel!
    @IBOutlet weak var inForCoLorLabel: UILabel!
    
    var redColor: CGFloat = 100 {
        didSet {
            changeVaLueCoLor()
        }
    }
    var greenColor: CGFloat = 100 {
        didSet {
            changeVaLueCoLor()
        }
    }
    
    var blueColor: CGFloat = 100 {
        didSet {
            changeVaLueCoLor()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        changeVaLueCoLor()
        boardCoLorLabel.clipsToBounds = true
        boardCoLorLabel.layer.cornerRadius = 20
        redSlider.value = Float(greenColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        changeVaLueCoLor()
    }
    
    @IBAction func changeVaLueCoLor(_ sender:Any) {
        redColor = CGFloat(redSlider.value)
    }
    @IBAction func changeGreenVaLueCoLor(_ sender: Any) {
        greenColor = CGFloat(greenSlider.value)
    }
    @IBAction func changeBlueVaLueCoLor(_ sender:Any) {
        blueColor = CGFloat(blueSlider.value)
    }
    
    func changeVaLueCoLor() {
        self.boardCoLorLabel.backgroundColor = UIColor(displayP3Red: redColor/255, green: greenColor/255, blue: blueColor/255, alpha: 1)
        self.inForCoLorLabel.text = "CoLor( R: \(Int(redColor)), G: \(Int(greenColor)), B: \(Int(blueColor)))"
    }
}

