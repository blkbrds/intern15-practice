//
//  DetailPostViewController.swift
//  BaitapRealm2
//
//  Created by ADMIN on 8/5/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class DetailPostViewController: BaseViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var datePostLabel: UILabel!
    
    var detailContentPost: String = ""
    var detailDatePost: String = ""
    var titlePost: String = ""
    var post: Post?
    var viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupData() {
        title = titlePost
        datePostLabel.text = detailDatePost
        contentLabel.text = detailContentPost
    }
    
    @IBAction func editPostButtonTouchUpInside(_ sender: Any) {
        let add = AddPostViewController()
        add.isAdd = false
        add.titlePost = titlePost
        add.detailContentPost = detailContentPost
        add.post = post
        self.navigationController?.pushViewController(add, animated: true)
    }
    
    @IBAction func deletePostButtonTouchUpInside(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Do you want to delete this post?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) in
            do {
                if let post = self.post {
                    let realm = try Realm()
                    try realm.write {
                        realm.delete(post)
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } catch {
                print("Lỗi Delete đối tượng")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
