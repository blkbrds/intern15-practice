//
//  ViewController.swift
//  AutoLayoutBasic
//
//  Created by TranVanTien on 11/20/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private var content: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        let chooseExercise = 10
        setupUI(chooseExercise: chooseExercise)
    }

    private func setupUI(chooseExercise: Int) {
        switch chooseExercise {
        case 1:
            content = Bundle.main.loadNibNamed("BaiTap01", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 111:
            content = Bundle.main.loadNibNamed("BaiTap01Comma1", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 2:
            content = Bundle.main.loadNibNamed("BaiTap02", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 21:
            content = Bundle.main.loadNibNamed("BaiTap02Comma1", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 3:
            content = Bundle.main.loadNibNamed("BaiTap03", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 31:
            content = Bundle.main.loadNibNamed("BaiTap03Comma1", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 32:
            content = Bundle.main.loadNibNamed("BaiTap03Comma2", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 4:
            content = Bundle.main.loadNibNamed("BaiTap04", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 41:
            content = Bundle.main.loadNibNamed("BaiTap04Comma1", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 42:
            content = Bundle.main.loadNibNamed("BaiTap04Comma2", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 43:
            content = Bundle.main.loadNibNamed("BaiTap04Comma3", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 44:
            content = Bundle.main.loadNibNamed("BaiTap04Comma4", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 5:
            content = Bundle.main.loadNibNamed("BaiTap05", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 51:
            content = Bundle.main.loadNibNamed("BaiTap05Comma1", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 52:
            content = Bundle.main.loadNibNamed("BaiTap05Comma2", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 53:
            content = Bundle.main.loadNibNamed("BaiTap05Comma3", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 54:
            content = Bundle.main.loadNibNamed("BaiTap05Comma4", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 6:
            content = Bundle.main.loadNibNamed("BaiTap06", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 61:
            content = Bundle.main.loadNibNamed("BaiTap06Comma1", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 62:
            content = Bundle.main.loadNibNamed("BaiTap06Comma2", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 63:
            content = Bundle.main.loadNibNamed("BaiTap06Comma3", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 64:
            content = Bundle.main.loadNibNamed("BaiTap06Comma4", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 8:
            content = Bundle.main.loadNibNamed("BaiTap08", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 9:
            content = Bundle.main.loadNibNamed("InfoAvatarView", owner: self, options: nil)?[0] as? InfoAvatarView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 10:
            content = Bundle.main.loadNibNamed("AutoConstraints", owner: self, options: nil)?[0] as? AutoConstraints
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 11:
            content = Bundle.main.loadNibNamed("ExerciseStackView", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 12:
            content = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 14:
            content = Bundle.main.loadNibNamed("InfoUserDetailView", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        case 13:
            content = Bundle.main.loadNibNamed("YourProfileView", owner: self, options: nil)?[0] as? BaiTapAutoLayoutBasicView
            content?.frame = UIScreen.main.bounds
            guard let content = content else { return }
            view.addSubview(content)
        default:
            print("No content")
        }
    }
}
