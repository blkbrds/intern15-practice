//
//  Ex9ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/10/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex9ViewController: ExerciseViewController {
    
    //MARK: - Properties
    var images: [Image] = [Image(image: "sieunhan1", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
                           Image(image: "sieunhan2", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
                           Image(image: "sieunhan3", description: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                           Image(image: "sieunhan4", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                           Image(image: "sieunhan5", description: " Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                           Image(image: "sieunhan6", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                           Image(image: "sieunhan7", description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source."),
                           Image(image: "sieunhan8", description: " Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32."),
                           Image(image: "sieunhan9", description: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."),
                           Image(image: "sieunhan10", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. ")]
    var index = 0
    
    @IBOutlet private weak var imageScrollView: UIScrollView!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var descriptionLable: UILabel!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        leftButton.isEnabled = false
    }
    
    //MARK: - config
    override func setupUI() {
        super.setupUI()
        setupImageScrollView()
        for index in 0..<images.count {
            createImageScrollView(index: index)
        }
        setupDescriptionLable()
    }
    
    func setupImageScrollView() {
        imageScrollView.contentSize = CGSize(width: 0.85 * self.view.frame.width * CGFloat(images.count), height: 0.85 * self.view.frame.width * 0.8)
    }
    
    func createImageScrollView(index: Int) {
        let imageView = UIImageView()
        if let image = UIImage(named: images[index].image) {
            imageView.image = image
        }else {
            imageView.image = UIImage(named: "default")
        }
        imageView.contentMode = .scaleToFill
        let originPoint = CGPoint(x: imageScrollView.contentSize.width * CGFloat(index) / CGFloat(images.count), y: 0)
        imageView.frame = CGRect(origin: originPoint, size: CGSize(width: 0.85 * self.view.frame.width, height: 0.85 * self.view.frame.width * 0.8))
        imageScrollView.addSubview(imageView)
    }
    
    func setupDescriptionLable() {
        descriptionLable.text = images[index].description
    }
    
    
    //MARK: - Action
    @IBAction func handleLeftButton(_ sender: UIButton) {
        guard index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.5, animations: {
            self.imageScrollView.contentOffset = CGPoint(x: CGFloat(self.index) * 0.85 * self.view.frame.width, y: 0)
            self.descriptionLable.text = self.images[self.index].description
            self.rightButton.setImage(UIImage(named: "icons8-right"), for: .normal)
            self.rightButton.isEnabled = true
        }) { (done) in
            if self.index == 0 {
                self.leftButton.setImage(UIImage(named: "icons8-hidden-left"), for: .normal)
                self.leftButton.isEnabled = false
            }
        }
    }
    
    @IBAction func handleRighttButton(_ sender: UIButton) {
        guard index < images.count - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.5, animations: {
            self.imageScrollView.contentOffset = CGPoint(x: CGFloat(self.index) * 0.85 * self.view.frame.width, y: 0)
            self.descriptionLable.text = self.images[self.index].description
            self.leftButton.setImage(UIImage(named: "icons8-left"), for: .normal)
            self.leftButton.isEnabled = true
        }) { (done) in
            if self.index == self.images.count - 1 {
                self.rightButton.setImage(UIImage(named: "icons8-hidden-right"), for: .normal)
                self.rightButton.isEnabled = false
            }
        }
    }
    
}
