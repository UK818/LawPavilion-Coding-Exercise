//
//  DetailViewController.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 16/05/2022.
//

import UIKit

class DetailViewController: UIViewController {
	
	private let detailViewLayout = DetailViewLayout()
	private let viewModel = ServiceViewModel()
	
	var container: UIStackView!
	var login: UILabel!
	var avatar: UIImageView!
	var type: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		setupLayout()
    }
	
	private func setupLayout() {
		
		container = detailViewLayout.container
		login = detailViewLayout.login
		avatar = detailViewLayout.avatar
		type = detailViewLayout.type
		
		view.addSubview(container)
		container.addArrangedSubview(login)
		container.addArrangedSubview(avatar)
		container.addArrangedSubview(type)
		
		NSLayoutConstraint.activate([
			
			container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			container.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60),
			container.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -100)
			
		])
	}
	
	func populateView(with data: User) {
		view.largeContentTitle = data.login
		login?.text = data.login
		viewModel.loadDetailImage(with: data.avatarURL, imageView: avatar)
		type?.text = data.type
	}

}
