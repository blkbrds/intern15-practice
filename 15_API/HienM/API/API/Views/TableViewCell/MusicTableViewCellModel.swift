//
//  MusicTableViewCellModel.swift
//  API
//
//  Created by Ngoc Hien on 3/4/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import Foundation

final class MusicTableViewCellModel {
	
	// MARK: - Properties
	private(set) var imageUrl: String
	private(set) var songName: String
	private(set) var indexPath: IndexPath
	
	// MARK: - Init
	init(imageUrl: String, songName: String, indexPath: IndexPath) {
		self.imageUrl = imageUrl
		self.songName = songName
		self.indexPath = indexPath
	}
}
