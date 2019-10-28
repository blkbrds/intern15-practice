<<<<<<< HEAD

import UIKit

final class Ex9ViewController: BaseViewController {
    @IBOutlet weak var imgaScrollView: UIScrollView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!

    var infoText: [String] = ["Không những thế những khát khao của Goku trong cuộc chiến đấu này muốn cứu vũ trụ của mình khỏi diệt vong đã thách thức khiến anh vượt qua được các giới hạn của bản thân đến được một tầm sức mạnh mới.",
        "Bản năng vô cực hoàn chỉnh của Goku đem tới cho anh một điều nổi bật - mái tóc trắng. Nó tạo cảm giác cho người xem rằng nhân vật này trở nên bá đạo chẳng kém gì thần thánh.",
        "Bản năng vô cực đúng là hình dáng cuối cùng và mạnh nhất của Goku, có cảm giác anh có thể hạ gục được bất kỳ đối thủ nào với nó. ",
        "Khi Goku tiến vào trạng thái vô cực lần đầu, cơ thể anh đã phải chịu tổn thương đáng kể. Trong cuọc chiến với Jiren, Goku đã tiến vào trạng thái hoàn chỉnh và có thể chiến đấu mà không cần suy nghĩ. ",
        "Có thể nói, bản năng vô cực của Goku vẫn có giới hạn của nó, thế nhưng cách sử dụng của Goku đã chứng minh rằng, anh không chỉ vượt trội nhờ vào sức mạnh mà còn nhờ vào kỹ năng của mình.",
        "Bản năng vô cực là hình thái biến hình cuối cùng của Goku, nhưng nhiều người cho rằng nó chỉ là một kỹ năng. Mặc dù nó có sự biến đổi về mặt hình dáng",
        "Bản năng vô cực giúp Goku mạnh hơn nhưng anh không thể giữ được nó lâu dài mà chỉ một thời gian ngắn, tuy nhiên nó giúp anh tập trung và mạnh hơn trước.",
        "Dragon Ball Xenoverse 2 là tựa game hành động đối kháng nổi tiếng của hãng Bandai Namco phát hành hồi năm 2016. Gần đây, cái tên này trở thành tâm điểm chú ý của các fan anime khi hé lộ những hình ảnh chưa từng xuất hiện của Bản năng Vô cực Tối thượng.",
        "Những hình ảnh này được lấy từ gói nội dung tải về (DLC) Extra Pack 2 sẽ phát hành vào 28/02 tới đây. Trong đó, người chơi có thể điều khiển các nhân vật mới như Jiren, Android 17, Fu và đặc biệt là Goku ở trạng thái Bản năng Vô cực Tối thượng.",
        "Ngoài những thêm thắt nêu trên, gói Extra Pack 2 còn bổ sung 5 nhiệm vụ mới, 8 skill mới và 5 đòn đặc biệt mới. Gói DLC này có giá 16.99 USD, nhưng người sở hữu Dragon Ball Xenoverse 2 có thể tải về gói miễn phí khác với 5 trang phục và 3 phụ kiện mới.",
        "Chiêm ngưỡng Bản năng Vô cực Tối thượng của Goku trong Dragon Ball Xenoverse 2 Dù chưa xuất hiện trên anime thế nhưng những hình ảnh đầu tiên của Bản năng Vô cực Tối thượng đã xuất hiện ngập tràn trên mạng."]
=======
//
//  Ex9ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex9ViewController: BaseViewController {
>>>>>>> master

    override func viewDidLoad() {
        super.viewDidLoad()
    }
<<<<<<< HEAD
    override func setupUI() {
        super.setupUI()
        self.title = "Ex9"
        textLabel.text = infoText[0]
    }
    override func setupData() {
    }
    var index = 0
    @IBAction func handleRighttButton(_ sender: UIButton) {
        guard index >= 0 && index < 9 else { return }
        index += 1
        UIView.animate(withDuration: 0.5, animations: {
            self.imgaScrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.imgaScrollView.frame.width, y: 0)
            self.textLabel.text = self.infoText[self.index]
        })
    }
    @IBAction func handleLeftButton(_ sender: UIButton) {
        guard index <= 9 && index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.5, animations: {
            self.imgaScrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.imgaScrollView.frame.width, y: 0)
            self.textLabel.text = self.infoText[self.index]
        })
    }
=======
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex9"
    }
    
    override func setupData() {
    }


>>>>>>> master
}
