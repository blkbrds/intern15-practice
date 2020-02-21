//
//  CollectionViewModel.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/20/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import Foundation
import UIKit
final class SecondCollectionViewModel {
	var caffeeImage: String
	var name: String
	var addressL: String
	var rateL: String
	
	init(image: String, name: String, addressL: String, rateL: String) {
		self.caffeeImage = image
		self.name = name
		self.addressL = addressL
		self.rateL = rateL
	}
}
