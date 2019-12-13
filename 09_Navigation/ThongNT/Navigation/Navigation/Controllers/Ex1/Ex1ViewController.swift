//
//  Ex1ViewController.swift
//  PracticeTemplate


import UIKit

final class Ex1ViewController: BaseViewController {

    var exercise: Exercise?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller A"
    }

    @IBAction func clickNextButton(_ sender: Any) {
        navigationController?.pushViewController(BViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
