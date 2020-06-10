//
//  bai9ViewController.swift
//  AutoLayout
//
//  Created by ADMIN on 4/13/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class Bai9ViewController: UIViewController {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var descriptionView: UITextView!
    private let textContent: [String] = ["Appaloosa (tên một dòng ngựa đua Mỹ): đây là dòng cẩm thạch của tôi và cô bạn Kasarcik. Chúng có nền trắng với hoa văn cẩm thạch. Không giống như những con cẩm thạch khác, hoa văn của chúng rất ổn định và không thay đổi theo thời gian. Chúng được xếp vào loại cẩm thạch.","Armadillo (tên một loại thú tương tự như con tê tê ở Mỹ): đây là dòng cá của tôi với đặc điểm thân có lớp metallic thật dày và lan đến đầu và mặt như áo giáp. Chúng được xếp vào thể loại metallic nền sẫm hay màu tự do (AOC).","Black/Green (đen/xanh): màu metallic xanh lục sáng trên nền cẩm thạch-đen[. Đây là những con cá tuyệt đẹp trông giống như những con rồng nhỏ. Chúng có thể được xếp vào loại metallic nền sẫm hay trong một số trường hợp, bướm hay nhị sắc nền sẫm.","Black Orchid (hắc lan): tên này được Henry Yin ở Indonesia đưa ra để mô tả dòng cá đuôi tưa đoạt giải độc đáo của mình. Dòng cá này có màu đen với thật nhiều màu xanh thép trên vây và tia vây. Đây là loại cá rất đẹp và khá hiếm. Thật không may, nó khó đạt tiêu chuẩn triển lãm bởi vì theo chuẩn của IBC thì loại màu đen bị dính màu ánh kim bị coi là lỗi, trong khi việc màu vây không hoàn toàn khác biệt với màu thân khiến nó không thể xếp vào loại nhị sắc nền sẫm.","Canadian Flag (cờ Canada): theo tôi được biết thì chỉ mình tôi dùng tên này. Đây là dòng cá bướm đỏ/trắng đặc biệt với thân màu trắng/cambodian. Chúng được xếp vào loại bướm.","Calico (vải hoa): thường là loại cẩm thạch đa sắc, nhất là màu cẩm thạch vàng. Vì màu sắc và sự độc đáo, chúng vẫn được xếp vào loại cẩm thạch truyền thống.","Black Crystal (tinh thể đen): dòng cẩm thạch nền đen với cá cái có khả năng sinh sản. Mức độ đen hiếm khi nào bằng với dòng Black Melano hay Super Black.","Apache (tên một bộ lạc da đỏ): đây là loại cá cẩm thạch cambodian bướm. Tuỳ theo hoa văn mà chúng có thể được xếp vào thể loại nhị sắc nền nhạt, cẩm thạch hay bướm.","Dreamcatcher (ngáo ộp): dòng cá cẩm thạch – đen với hoa văn bướm đen/trắng. Dòng này có thể xếp vào loại cẩm thạch hay bướm.","Half Sun (bán dương): tuỳ người, có người cho đó là cá đuôi tưa xoè đủ 180 độ hay có người lại cho đó là cá đuôi lược (combtail) xoè đủ 180 độ.","Lemon Meringue (bánh chanh): một loại betta màu vàng với hoa văn bướm vàng/trắng. Chúng được xếp vào loại bướm." ]
   
    var image = 1
    var scrip = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        imageScrollView.contentSize = CGSize(width: imageScrollView.bounds.width * 10, height: imageScrollView.bounds.height)
        for index in 0...9 {
            let imageView = UIImageView(image: UIImage(named: String(index + 1 )))
            imageView.frame = CGRect(x: imageScrollView.bounds.width * CGFloat(index), y: 0, width: imageView.bounds.width, height: imageView.bounds.height)
            imageScrollView.addSubview(imageView)
        }
        descriptionView.text = textContent[Int(scrip)]
    }
    
    @IBAction func clickRightButton(_ sender: Any) {
        if self.image == 10 { return }
        image += 1
        scrip += 1
        descriptionView.text = textContent[Int(scrip)]
        UIView.animate(withDuration: 0.5, animations: {
            self.imageScrollView.contentOffset = CGPoint(x: CGFloat(self.image - 1) * self.imageScrollView.bounds.width, y: 0)
        })
    }
    
    @IBAction func clickLeftButton(_ sender: Any) {
        if self.image == 1 { return }
        image -= 1
        scrip -= 1
        descriptionView.text = textContent[Int(scrip)]
        UIView.animate(withDuration: 0.5, animations: {self.imageScrollView.contentOffset = CGPoint(x: CGFloat(self.image - 1) * self.imageScrollView.bounds.width, y: 0)})
    }
}
