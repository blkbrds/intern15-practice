//
//  ViewController.swift
//  BaiTap9
//
//  Created by PCI0012 on 4/15/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sttLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var location = 1
    
    let contents: [String] = [" The 2019–20 UEFA Champions League is the 65th season of Europe's premier club football tournament organised by UEFA, and the 28th season since it was renamed from the European Champion Clubs' Cup to the UEFA Champions League"," The final will be played at the Atatürk Olympic Stadium in Istanbul"," The winners of the 2019–20 UEFA Champions League will earn the right to play against the winners of the 2019–20 UEFA Europa League in the 2020 UEFA Super Cup"," they will also qualify for the 2020 FIFA Club World Cup in Qatar"," They will also automatically qualify for the 2020–21 UEFA Champions League group stage, and if they have already qualified through their league performance, the berth reserved will be given to the champions of the 2019–20 Eredivisie, the 11th-ranked association according to next season's access list"," The video assistant referee (VAR) system has been used in the competition from the play-off round onwards"," Liverpool were the defending champions, but they were eliminated by Atlético Madrid in the round of 16"," Following the first set of round of 16 second leg matches, the competition was postponed indefinitely due to the 2020 coronavirus pandemic in Europe"," The final, originally scheduled to take place on 30 May 2020, was officially postponed on 23 March 2020"," On 1 April 2020, all matches were suspended until further notice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentLabel.text = contents[0]
        sttLabel.text = "1/10"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configScrollView()
    }
    
    private func configScrollView() {
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * CGFloat(contents.count), height: scrollView.bounds.height)
        for i in 0...9 {
            let imageView = UIImageView(image: UIImage(named: String(i + 1)))
            imageView.frame = CGRect(x: scrollView.bounds.width * CGFloat(i), y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
        }
    }
    
    @IBAction private func turnToRightButtonTouchUpInside(_ sender: Any) {
        if location == 10 {
            return
        }
        location += 1
        UIView.animate(withDuration: 1, animations: {
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.width * CGFloat(self.location - 1) , y: 0)
        })
        contentLabel.text = contents[location - 1]
        sttLabel.text = "\(location)/10"
    }
    
    @IBAction private func turnToLeftButtonTouchUpInside(_ sender: Any) {
        if location == 1 {
            return
        }
        location -= 1
        UIView.animate(withDuration: 1, animations: {
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.bounds.width * CGFloat(self.location - 1), y: 0)
        })
        contentLabel.text = contents[location - 1]
        sttLabel.text = "\(location)/10"
    }
}
