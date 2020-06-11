import Foundation
import UIKit

class Git {
    var url: String
    var forksURL: String
    var commitsUrl: String
    var id: String
    var nodeId: String
    var htmlUrl: String
    var publiC: Bool
    var createdAt: String
    var updateAt: String
    var commentsURL: String
    
    var files: [GitFile] = []
    
    var owner: Owner
    var thumbnailImage: UIImage?

    init(json: JSON) {
        self.url = json["url"] as! String
        self.forksURL = json["forks_url"] as! String
        self.commitsUrl = json["commits_url"] as! String
        self.id = json["id"] as! String
        self.nodeId = json["node_id"] as! String
        self.htmlUrl = json["html_url"] as! String
        self.publiC = json["public"] as! Bool
        self.createdAt = json["created_at"] as! String
        self.updateAt = json["updated_at"] as! String
        self.commentsURL = json["comments_url"] as! String
        self.commitsUrl = json["commits_url"] as! String
        
        let files = json["files"] as! JSON
        let keys = Array(files.keys) // get The Keys
        
        for key in keys {
            let item = files[key] as! JSON
            
            let filename = item["filename"] as! String
            let type = item["type"] as! String
            let language: String
            if let language1 = item["language"] as? String {
                language = language1
            } else {
                language = ""
            }
            let raw_url = item["raw_url"] as! String
            let size = item["size"] as! Int
            
            let gitFile = GitFile(fileName: filename, type: type, language: language, rawUrl: raw_url, size: size)
            self.files.append(gitFile)
        }
        let owner = json["owner"] as! JSON
        self.owner = Owner(json: owner)
    }
}
