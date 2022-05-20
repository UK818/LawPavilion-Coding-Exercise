//
//  ActivityIndicatorCell.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 18/05/2022.
//

import UIKit

class ActivityIndicatorCell: UICollectionViewCell {
		
	static let identifier = "ActivityIndicatorCell"
	private let viewLayout: ActivityIndicatorViewLayout = ActivityIndicatorViewLayout()
	var indicator: UIActivityIndicatorView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	func setup(){
		self.indicator = viewLayout.indicator
		contentView.addSubview(indicator)
		NSLayoutConstraint.activate([
			indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			indicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
		indicator.startAnimating()
	}
	
}
