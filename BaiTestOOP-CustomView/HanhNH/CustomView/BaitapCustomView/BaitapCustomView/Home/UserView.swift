//
//  UserView.swift
//  BaitapCustomView
//
//  Created by ANH NGUYỄN on 1/13/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func nameAvatar(avatar: String)
}

final class UserView: UIView {
    
    private var avatarImageView: UIImageView!
    private var nameLabel: UILabel!
    private var internButton: UIButton!
    private var privateButton: UIButton!
    private var doctorButton: UIButton!
    private var engineerButton: UIButton!
    private var schoolLabel: UILabel!
    private var diachiLabel: UILabel!
    private var commentLabel: UILabel!
    private var unFavorite: UIButton!
    private var favorite: UIButton!

    weak var delegate: MyAvatarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpUI() {
        //avatar
        avatarImageView = UIImageView(frame: CGRect(x: 200, y: 0, width: frame.width, height: 3 * frame.height / 4))
        avatarImageView.image = UIImage(named: "ic-avatar")
        avatarImageView.contentMode = .scaleToFill
        guard let useAvatar = avatarImageView else { return }
        addSubview(useAvatar)

        nameLabel = UILabel(frame: CGRect(x: 0, y: 70, width: 170, height: 50))
        nameLabel?.textAlignment = .center
        nameLabel?.backgroundColor = .orange
        nameLabel?.text = "Nguyen hong Hanh"
        nameLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guard let nameLabel = nameLabel else { return }
        addSubview(nameLabel)

        internButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        internButton?.backgroundColor = .black
        internButton.setTitle("Intern", for: .normal)
        internButton.titleLabel?.textColor = .red
        internButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guard let intern = internButton else { return }
        addSubview(intern)
        
        schoolLabel = UILabel(frame: CGRect(x: 0, y: 140, width: 170, height: 50))
        schoolLabel?.textAlignment = .center
        schoolLabel?.backgroundColor = .orange
        schoolLabel?.text = "MKSchool inc"
        schoolLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guard let school = schoolLabel else { return }
        addSubview(school)
        
        diachiLabel = UILabel(frame: CGRect(x: 0, y: 210, width: 170, height: 50))
        diachiLabel?.textAlignment = .center
        diachiLabel?.backgroundColor = .orange
        diachiLabel?.text = "Viet Nam, Da Nang"
        diachiLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guard let diachi = diachiLabel else { return }
        addSubview(diachi)
        
        privateButton = UIButton(frame: CGRect(x: 0, y: 280, width: 60, height: 30))
        privateButton?.backgroundColor = .black
        privateButton.setTitle("private", for: .normal)
        privateButton.titleLabel?.textColor = .red
        privateButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        guard let privateButton = privateButton else { return }
        addSubview(privateButton)
        
        doctorButton = UIButton(frame: CGRect(x: privateButton.frame.maxX + 10, y: 280, width: 60, height: 30))
        doctorButton?.backgroundColor = .black
        doctorButton.setTitle("Doctor", for: .normal)
        doctorButton.titleLabel?.textColor = .red
        doctorButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        guard let doctorButton = doctorButton else { return }
        addSubview(doctorButton)
        
        engineerButton = UIButton(frame: CGRect(x: doctorButton.frame.maxX + 10, y: 280, width: 60, height: 30))
        engineerButton?.backgroundColor = .black
        engineerButton.setTitle("Engineer", for: .normal)
        engineerButton.titleLabel?.textColor = .red
        engineerButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        guard let engineerButton = engineerButton else { return }
        addSubview(engineerButton)
        
        commentLabel = UILabel(frame: CGRect(x: 0, y: engineerButton.frame.maxY + 20, width: 300, height: 40))
        commentLabel?.textAlignment = .center
        commentLabel?.backgroundColor = .orange
        commentLabel?.text = "MKSchool iquygdyqgdygdgdgsdgasagsdgsakjdgdjhsjdkhsakjhdsakjdhsajdhsdhsajdjsakhdsjakhdjskahdjskahdjskahdjksahdjksahdjksahdjkshadjkhsadjkhsajdkhsadjksahdjkasdjkhasjdkhasjdkhasjdkhasjkdhsadjkhsajkdhsadkjasdjksahdjkashdjkashdjkashdjksahdjkashdjkash"
        commentLabel.numberOfLines = 0
        commentLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guard let comment = commentLabel else { return }
        addSubview(comment)
        
        unFavorite = UIButton(frame: CGRect(x: 50, y: comment.frame.maxY + 20, width: 100, height: 50))
        unFavorite?.backgroundColor = .black
        unFavorite.setTitle("UnFavorite", for: .normal)
        unFavorite.titleLabel?.textColor = .red
        unFavorite?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        guard let UnFavorite = unFavorite else { return }
        addSubview(UnFavorite)
        
        favorite = UIButton(frame: CGRect(x: UnFavorite.frame.maxX + 30, y: comment.frame.maxY + 20, width: 100, height: 50))
        favorite?.backgroundColor = .black
        favorite.setTitle("Favorite", for: .normal)
        favorite.titleLabel?.textColor = .red
        favorite?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        guard let favorite = favorite else { return }
        addSubview(favorite)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tapUnFavorite))
        tapGestureRecognizer.name = nameLabel.text
        nameLabel.isUserInteractionEnabled = true
        UnFavorite.isUserInteractionEnabled = true
        favorite.isUserInteractionEnabled = true
        nameLabel.addGestureRecognizer(tapGestureRecognizer)
        UnFavorite.addGestureRecognizer(tapGestureRecognizer2)
    }

    func updateUI(name: String, imageName: String) {
        nameLabel.text = name
        avatarImageView.image = UIImage(named: imageName)
    }

    @objc private func tapGesture(sender: UITapGestureRecognizer) {
        if let userName = nameLabel?.text {
            delegate?.nameAvatar(avatar: userName)
        }
    }
    
    @objc private func tapUnFavorite(sender: UITapGestureRecognizer) {
        print("ahihi")
    }
}
