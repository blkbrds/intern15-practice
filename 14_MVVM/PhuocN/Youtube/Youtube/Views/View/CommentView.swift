//
//  CommentView.swift
//  Youtube
//
//  Created by PhuocNguyen on 11/18/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol CommentViewDelegate: class {
    func commentView(_ view: CommentView, needPerform action: CommentView.Action)
}

final class CommentView: UIView {
    //MARK: -IBOutlet
    @IBOutlet private weak var commentTextField: UITextField!
    @IBOutlet private weak var bottomContentViewConstraint: NSLayoutConstraint!
    //MARK: -Properties
    enum Action {
        case hide
        case send(String)
        case show
        case cancel
    }
    weak var delegate: CommentViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        isHidden = true
        commentTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyBoardNotification(notification:)), name: UIResponder.keyboardWillShowNotification , object:  nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyBoardNotification(notification:)), name: UIResponder.keyboardWillHideNotification , object:  nil)
    }
    
    //MARK: -privatefunc
    func hide() {
        isHidden = true
        commentTextField.resignFirstResponder()
    }
    
    func show() {
        isHidden = false
        commentTextField.becomeFirstResponder()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide()
    }
    
    private func sendComment(with textField: UITextField) {
        if let comment = textField.text, !comment.isEmpty {
            delegate?.commentView(self, needPerform: .send(comment))
        }
        textField.resignFirstResponder()
    }
    
    @objc private func showKeyBoardNotification(notification: Notification) {
        if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomContentViewConstraint.constant = -keyBoardSize.height
            UIView.animate(withDuration: 0, animations: {
                self.layoutIfNeeded()
            })
        }
    }
    
    @objc private func hideKeyBoardNotification(notification: Notification) {
        if let _ = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] {
            bottomContentViewConstraint.constant = 0
            UIView.animate(withDuration: 0, animations: {
                self.layoutIfNeeded()
            })
        }
    }
    
    //MARK: -IBAction
    @IBAction private func sendButtonTouchUpInside(_ sender: Any) {
        sendComment(with: commentTextField)
    }
    
    deinit {
        print("CommentView was deinit")
    }
}

//MARK: -TextFieldDelegate
extension CommentView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendComment(with: textField)
        return true
    }
}
