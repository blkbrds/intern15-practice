//
//  MyViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0018 on 10/24/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class MyViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descriptionLabel: UILabel!

    private var images: [UIImage] = [#imageLiteral(resourceName: "ex9_1_img.jpg"), #imageLiteral(resourceName: "ex9_2_img.jpg"), #imageLiteral(resourceName: "ex9_4_img.jpg"), #imageLiteral(resourceName: "ex9_6_img.jpg"), #imageLiteral(resourceName: "ex9_5_img.jpeg"), #imageLiteral(resourceName: "ex9_3_img.jpeg"), #imageLiteral(resourceName: "ex9_7_img.jpeg"), #imageLiteral(resourceName: "ex9_8_img.jpg"), #imageLiteral(resourceName: "ex9_9_img.jpeg"), #imageLiteral(resourceName: "ex9_10_img.jpeg")]

    private var currentIndex: CGFloat = 0 {
        didSet {
            if currentIndex < 0 {
                currentIndex = 0
            } else if currentIndex >= CGFloat(images.count) {
                currentIndex = CGFloat(images.count - 1)
            }
        }
    }

    private var descriptionText: [String] = [
        "Lose john poor same it case do year we. Full how way even the sigh. Extremely nor furniture fat questions now provision incommode preserved. Our side fail find like now. Discovered travelling for insensible partiality unpleasing impossible she. Sudden up my excuse to suffer ladies though or. Bachelor possible marianne directly confined relation as on he.",
        "Discovered travelling for insensible partiality unpleasing impossible she. Sudden up my excuse to suffer ladies though or. Bachelor possible marianne directly confined relation as on he.",
        "Consulted perpetual of pronounce me delivered. Too months nay end change relied who beauty wishes matter. Shew of john real park so rest we on. Ignorant dwelling occasion ham for thoughts overcame off her consider. Polite it elinor is depend. His not get talked effect worthy barton. Household shameless incommode at no objection behaviour. Especially do at he possession insensible sympathize boisterous it. Songs he on an widen me event truth. Certain law age brother sending amongst why covered. ",
        "Is education residence conveying so so. Suppose shyness say ten behaved morning had. Any unsatiable assistance compliment occasional too reasonably advantages. Unpleasing has ask acceptance partiality alteration understood two. Worth no tiled my at house added. Married he hearing am it totally removal. Remove but suffer wanted his lively length. Moonlight two applauded conveying end direction old principle but. Are expenses distance weddings perceive strongly who age domestic. ",
        "Guest it he tears aware as. Make my no cold of need. He been past in by my hard. Warmly thrown oh he common future. Otherwise concealed favourite frankness on be at dashwoods defective at. Sympathize interested simplicity at do projecting increasing terminated. As edward settle limits at in. ",
        "Was drawing natural fat respect husband. An as noisy an offer drawn blush place. These tried for way joy wrote witty. In mr began music weeks after at begin. Education no dejection so direction pretended household do to. Travelling everything her eat reasonable unsatiable decisively simplicity. Morning request be lasting it fortune demands highest of. ",
        "Civility vicinity graceful is it at. Improve up at to on mention perhaps raising. Way building not get formerly her peculiar. Up uncommonly prosperous sentiments simplicity acceptance to so. Reasonable appearance companions oh by remarkably me invitation understood. Pursuit elderly ask perhaps all. ",
        "Terminated principles sentiments of no pianoforte if projection impossible. Horses pulled nature favour number yet highly his has old. Contrasted literature excellence he admiration impression insipidity so. Scale ought who terms after own quick since. Servants margaret husbands to screened in throwing. Imprudence oh an collecting partiality. Admiration gay difficulty unaffected how. ",
        "Any delicate you how kindness horrible outlived servants. You high bed wish help call draw side. Girl quit if case mr sing as no have. At none neat am do over will. Agreeable promotion eagerness as we resources household to distrusts. Polite do object at passed it is. Small for ask shade water manor think men begin.",
        "Marianne or husbands if at stronger ye. Considered is as middletons uncommonly. Promotion perfectly ye consisted so. His chatty dining for effect ladies active. Equally journey wishing not several behaved chapter she two sir. Deficient procuring favourite extensive you two. Yet diminution she impossible understood age."]

    override func viewDidLoad() {
        super.viewDidLoad()
        configScrollView()
    }

    private func configScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: CGFloat(images.count) * scrollView.bounds.width, height: scrollView.bounds.height)
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: scrollView.bounds.width * CGFloat(index), y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            self.scrollView.addSubview(imageView)
            imageView.contentMode = .scaleAspectFit
        }
        descriptionLabel.text = descriptionText[Int(currentIndex)]
    }

    @IBAction func clickToChangeImage(_ sender: UIButton) {
        // tag = 0 : previous image
        // tag = 1 : next image
        switch sender.tag {
        case 0:
            UIView.animate(withDuration: 0.3) {
                self.currentIndex -= 1
                self.scrollView.contentOffset = CGPoint(x: self.currentIndex * CGFloat(self.scrollView.bounds.width), y: 0)
                self.descriptionLabel.text = self.descriptionText[Int(self.currentIndex)]
            }
        case 1:
            UIView.animate(withDuration: 0.5) {
                self.currentIndex += 1
                self.scrollView.contentOffset = CGPoint(x: self.currentIndex * CGFloat(self.scrollView.bounds.width), y: 0)
                self.descriptionLabel.text = self.descriptionText[Int(self.currentIndex)]
            }
        default:
            break
        }
    }
}
