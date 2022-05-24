//
//  CollectionViewCell.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
	
	static let identifier = "collectionViewCell"
	private let viewLayout: CollectionViewLayout = CollectionViewLayout()
	private let serviceViewModel = ServiceViewModel(networkService: NetworkManager())
	
	var userView: UIStackView!
	var login: UILabel!
	var avatar: UIImageView!
	var type: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setUpCell() {
		userView = viewLayout.userView
		login = viewLayout.loginLabel
		avatar = viewLayout.avatar
		type = viewLayout.typeLabel
		
		contentView.backgroundColor = .white
		contentView.layer.cornerRadius = 25
		contentView.layer.borderWidth = 1
		contentView.addSubview(userView)
		userView.addArrangedSubview(login)
		userView.addArrangedSubview(avatar)
		userView.addArrangedSubview(type)
		
		NSLayoutConstraint.activate([
			userView.topAnchor.constraint(equalTo: contentView.topAnchor),
			userView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			userView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
		])
	}
	
	func populateCell(with data: User) {
		if data.login.count > 10 {
			let text = Array(data.login.lowercased())
			var newText = ""
			for i in 0...9 {
				newText += String(text[i])
			}
			login.text = newText
		} else {
			login.text = data.login
		}
		serviceViewModel.loadImage(with: data.avatarURL, imageView: avatar)
		type.text = data.type
	}
	
}
