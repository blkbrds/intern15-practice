//
//  ViewModel.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var caffe: [Caffee] = [Caffee(title: "souvernir", address: "24 NQ", rating: "9/10", distance: "3km", imageName: "souvernir"), Caffee(title: "Long Bar", address: "11 NQ", rating: "10/10", distance: "5km", imageName: "longbar"), Caffee(title: "Cloud Garden", address: "22NQ", rating: "8/10", distance: "4km", imageName: "cloudgarden"), Caffee(title: "Ador Cf", address: "ador", rating: "8/10", distance: "2km", imageName: "ador"), Caffee(title: "Sky 36", address: "23 NQ", rating: "9/10", distance: "4km", imageName: "images"),Caffee(title: "souvernir", address: "24 NQ", rating: "9/10", distance: "3km", imageName: "souvernir"), Caffee(title: "Long Bar", address: "11 NQ", rating: "10/10", distance: "5km", imageName: "longbar"), Caffee(title: "Cloud Garden", address: "22NQ", rating: "8/10", distance: "4km", imageName: "cloudgarden"), Caffee(title: "Ador Cf", address: "ador", rating: "8/10", distance: "2km", imageName: "ador"), Caffee(title: "Sky 36", address: "23 NQ", rating: "9/10", distance: "4km", imageName: "images"),Caffee(title: "souvernir", address: "24 NQ", rating: "9/10", distance: "3km", imageName: "souvernir"), Caffee(title: "Long Bar", address: "11 NQ", rating: "10/10", distance: "5km", imageName: "longbar"), Caffee(title: "Cloud Garden", address: "22NQ", rating: "8/10", distance: "4km", imageName: "cloudgarden"), Caffee(title: "Ador Cf", address: "ador", rating: "8/10", distance: "2km", imageName: "ador"), Caffee(title: "Sky 36", address: "23 NQ", rating: "9/10", distance: "4km", imageName: "images")]
    
    func numberOfRowsInSection() -> Int {
        return caffe.count
    }
    func cellForRowAt(indexPath: IndexPath) -> HomeCellViewModel {
        let item = caffe[indexPath.row]
        let viewModel = HomeCellViewModel(caffee: item)
        return viewModel
    }

}
