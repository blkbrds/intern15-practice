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
        let alert = UIAlertController(title: "Delete Item", message: "Are You Sure?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Not Yet", style: UIAlertAction.Style.default, handler: { _ in
        }))
        alert.addAction(UIAlertAction(title: "Yeah", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) in
            do {
                if let post = self.post {
                    let realm = try Realm()
                    try realm.write {
                        realm.delete(post)
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } catch {
                print("Failed Delete Item")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
