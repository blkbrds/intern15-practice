//
//  InfoAvatarView.swift
//  AutoLayoutBasic
//
//  Created by TranVanTien on 11/24/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

struct Avatar {
    var image: UIImage
    var contentImage: String
}

final class InfoAvatarView: UIView {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var commentButton: UIButton!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!

    private let avatars: [Avatar] = [Avatar(image: #imageLiteral(resourceName: "onepiece"), contentImage: "One Piece (ワンピース Wan Pīsu) là bộ manga dành cho lứa tuổi thiếu niên của tác giả Eiichiro Oda, được đăng định kì trên tạp chí Weekly Shōnen Jump, ra mắt lần đầu trên ấn bản số 34 vào ngày 19 tháng 7 năm 1997."),
                                     Avatar(image: #imageLiteral(resourceName: "luffy"), contentImage: "Monkey D. Luffy (モンキー･D･ルフィ Monkī D. Rufi) là nhân vật chính của One Piece và là thuyền trưởng của băng Hải tặc Mũ Rơm, anh có biệt danh là \"Luffy Mũ Rơm\" (麦わらのルフィ Mugiwara no Rufi). "),
                                     Avatar(image: #imageLiteral(resourceName: "zoro"), contentImage: "Roronoa Zoro (ロロノア・ゾロ) là kiếm sĩ của băng hải tặc Mũ Rơm, anh là thành viên thứ hai của băng Mũ Rơm. Zoro theo \"Tam Kiếm Phái\" và có biệt danh là \"Thợ săn Hải tặc Zoro\" (海賊狩りのゾロ Kaizoku Gari no Zoro), anh là chủ sở hữu của bốn thanh kiếm nằm trong các thanh kiếm quý của thế giới One Piece."),
                                     Avatar(image: #imageLiteral(resourceName: "nami"), contentImage: "Nami (ナミ) là Hoa Tiêu của băng hải tặc Mũ Rơm. Cô là thành viên thứ ba của băng và có biệt danh là \"Miêu tặc\" (Con Mèo Ăn Trộm). Giấc mơ của Nami là hoàn thành bản đồ của toàn thế giới trong One Piece."),
                                     Avatar(image: #imageLiteral(resourceName: "usopp"), contentImage: "Usopp (ウソップ Usoppu) là xạ thủ của băng hải tặc Mũ Rơm và là thành viên thứ tư của băng. Biệt danh hiện tại của Usopp là \"God\" (ゴッド Goddo, Chúa). Nhân dạng khác mà trước đây Usopp dùng và có trên lệnh truy nã là \"Sogeking\" (そげキング Sogekingu) với biệt danh \"Vua bắn tỉa\" (狙撃の王様 Sogeki no Ō-sama)."),
                                     Avatar(image: #imageLiteral(resourceName: "sanji"), contentImage: "Sanji (サンジ Sanji) là Đầu Bếp của băng hải tặc Mũ Rơm và là thành viên thứ năm của băng. Anh có biệt danh Sanji Chân Đen (黒脚のサンジ Kuro Ashi no Sanji) và có sở trường chiến đấu bằng chân. Ước mơ của Sanji là tìm thấy vùng biển huyền thoại \"All Blue\"."),
                                     Avatar(image: #imageLiteral(resourceName: "chopper"), contentImage: "Tonytony Chopper (トニートニー・チョッパー Tonī Tonī Choppā) là Bác sĩ của băng hải tặc Mũ Rơm và là thành viên thứ sáu của băng. Chopper có biệt danh \"Kẻ yêu kẹo bông\" Chopper (わたあめ大好きのチョッパー Watāme Daisuki no Choppā), cậu sở hữu trái ác quỷ trái ác quỷ Hito Hito (ヒトヒトの実 Hito Hito no Mi) hệ Zoan."),
                                     Avatar(image: #imageLiteral(resourceName: "nami"), contentImage: "Nico Robin (ニコ・ロビン Niko Robin?) là nhà Khảo Cổ Học của băng Mũ Rơm và là thành viên thứ bảy của băng hải tặc Mũ Rơm. Robin có biệt danh \"Đứa con của quỷ\" (悪魔の子 Akuma no Ko?), cô sở hữu trái ác quỷ Hana Hana (ハナハナの実 Hana Hana no Mi?) hệ Paramecia, với khả năng mọc cánh tay từ xa."),
                                     Avatar(image: #imageLiteral(resourceName: "franky"), contentImage: "Franky (フランキー Furankī?) là thợ đóng tàu của băng hải tặc Mũ Rơm và là thành viên thứ tám của băng. Biệt danh của anh là \"Người máy\" Franky (サイボーグ フランキー Saibōgu Furankī?), anh là một thợ đóng tàu tài ba và không chỉ dừng lại ở đó Franky còn giỏi ở nhiều mặt khác."),
                                     Avatar(image: #imageLiteral(resourceName: "brook"), contentImage: "Brook (ブルック Burukku?) là Nhạc Công của băng hải tặc Mũ Rơm và là thành viên thứ chín của băng. Brook có biệt danh là \"Brook Ngân Nga\" và là một nhạc công tài ba có thể chơi được nhiều loại nhạc cụ.")]
    private var index: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor

        setupButton(button: likeButton)
        setupButton(button: commentButton)
        setupButton(button: shareButton)
    }

    private func setupButton(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
    }

    private func updateUI(index: Int) {
        avatarImageView.image = avatars[index].image
        contentLabel.text = avatars[index].contentImage
        valueLabel.text = "\(index + 1)/\(avatars.count)"
    }

    @IBAction private func rightButonAction(_ sender: Any) {
        if index == avatars.count - 1 {
            index = 0
            updateUI(index: index)
        } else {
            index += 1
            updateUI(index: index)
        }
    }

    @IBAction private func leftButtonAction(_ sender: Any) {
        if index == 0 {
            index = avatars.count - 1
            updateUI(index: index)
        } else {
            index -= 1
            updateUI(index: index)
        }
    }
}
