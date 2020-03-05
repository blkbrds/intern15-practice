import Foundation
import UIKit

typealias DownloadImageCompletion = (UIImage?) -> Void
typealias Completion = (Bool, String) -> Void

final class Networking {
    //MARK: - singleton
    private static var sharedNetworking: Networking = {
        let networking = Networking()
        return networking
    }()
    
    class func shared() -> Networking {
        return sharedNetworking
    }
    
    //MARK: - init
    private init() {}
    
    //MARK: - request
    func request(with urlString: String, completion: @escaping (Data?, APIError?) -> Void) {
        guard let url = URL(string: urlString) else {
            let error = APIError.error("URL lỗi")
            completion(nil, error)
            return
        }
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, APIError.error(error.localizedDescription))
                } else {
                    if let data = data {
                        completion(data, nil)
                    } else {
                       completion(nil, APIError.error("Data format is error."))
                    }
                }
            }
        }
        task.resume()
    }
    
    //MARK: - downloader
    func downloadImage(url: String, completion: @escaping DownloadImageCompletion) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    completion(nil)
                } else {
                    if let data = data {
                        let image = UIImage(data: data)
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }
            }
        }
		DispatchQueue.global().async {
			 task.resume()
		}
    }    
}
