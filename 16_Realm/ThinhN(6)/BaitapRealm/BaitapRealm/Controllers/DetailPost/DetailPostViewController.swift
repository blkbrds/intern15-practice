//
//  DetailPostViewController.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/16/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class DetailPostViewController: BaseViewController {

    @IBOutlet weak var datePostLabel: UILabel!
    @IBOutlet weak var contentPostLabel: UILabel!

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
        contentPostLabel.text = detailContentPost
        
    }

    @IBAction func editPostButtonTouchUpInside(_ sender: Any) {
        let addPost = AddPostViewController()
        addPost.status = false
        addPost.titlePost = titlePost
        addPost.detailContentPost = detailContentPost
        addPost.post = post
        self.navigationController?.pushViewController(addPost, animated: true)
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
