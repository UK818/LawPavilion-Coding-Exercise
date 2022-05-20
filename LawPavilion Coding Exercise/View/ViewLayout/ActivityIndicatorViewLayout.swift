//
//  ActivityIndicatorViewLayout.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 18/05/2022.
//

import Foundation
import UIKit

public class ActivityIndicatorViewLayout {
	
	var indicator: UIActivityIndicatorView = {
		let view = UIActivityIndicatorView()
		view.style = .large
		return view
	}()
	
}
