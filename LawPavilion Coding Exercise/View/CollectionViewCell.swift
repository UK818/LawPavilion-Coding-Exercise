//
//  CollectionViewCell.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
	
	static let identifier = "cell"
	private let viewLayout: HomeViewLayout = HomeViewLayout()
	private let viewModel = ServiceViewModel()
	
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
		
		contentView.addSubview(userView)
		userView.addArrangedSubview(login)
		userView.addArrangedSubview(avatar)
		userView.addArrangedSubview(type)
		
		NSLayoutConstraint.activate([
			userView.topAnchor.constraint(equalTo: contentView.topAnchor),
			userView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			userView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
			
//			login.widthAnchor.constraint(equalTo: userView.widthAnchor),
			login.leadingAnchor.constraint(equalTo: userView.leadingAnchor),
			login.trailingAnchor.constraint(equalTo: userView.trailingAnchor, constant: 10),
			
			avatar.heightAnchor.constraint(equalToConstant: 150)
			
		])
	}
	
	func populateCell(with data: User) {
		login.text = data.login
		viewModel.loadImage(with: data.avatarURL, imageView: avatar)
		type.text = data.type
	}
	
}
