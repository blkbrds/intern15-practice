//
//  ExerciseThreeViewController+Extension.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/11/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

// MARK: - Extension struct DummyData
extension ExerciseThreeViewController {
    struct DummyData {
        static var dsHaiTacMuRom: [Avatar] = {
            let avatars = [Avatar(name: "Luffy", nameImage: "luffy"),
                Avatar(name: "Nami", nameImage: "nami"),
                Avatar(name: "Sanji", nameImage: "sanji"),
                Avatar(name: "Usopp", nameImage: "usopp"),
                Avatar(name: "Zoro", nameImage: "zoro"),
                Avatar(name: "Brook", nameImage: "brook"),
                Avatar(name: "Robin", nameImage: "robin"),
                Avatar(name: "Franky", nameImage: "franky"),
                Avatar(name: "Chopper", nameImage: "chopper")
            ]
            return avatars
        }()

        static var dsHaiTac: [Avatar] = {
            let avatars = [Avatar(name: "Luffy", nameImage: "luffy-background"),
                Avatar(name: "Nami", nameImage: "nami-background"),
                Avatar(name: "Sanji", nameImage: "sanji-background"),
                Avatar(name: "Usopp", nameImage: "usopp-background"),
                Avatar(name: "Zoro", nameImage: "zoro-background"),
                Avatar(name: "Brook", nameImage: "brook-background"),
                Avatar(name: "Robin", nameImage: "robin-background")
            ]
            return avatars
        }()

        static var girls: [Avatar] = {
            let avatars = [Avatar(name: "Vietnam", nameImage: "girl-1"),
                Avatar(name: "日本", nameImage: "girl-2"),
                Avatar(name: "中国", nameImage: "girl-3"),
                Avatar(name: "韓国", nameImage: "girl-4"),
                Avatar(name: "Laos", nameImage: "girl-5"),
                Avatar(name: "イギリス", nameImage: "girl-6"),
                Avatar(name: "アメリカ", nameImage: "girl-7")
            ]
            return avatars
        }()
    }
}
