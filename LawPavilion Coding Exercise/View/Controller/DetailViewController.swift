//
//  DetailViewController.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 16/05/2022.
//

import UIKit

class DetailViewController: UIViewController {

	private var detailViewLayout: DetailViewLayout!
	private var serviceViewModel: ServiceViewModel!
	private var networkService: NetworkService!
	
	private var container: UIStackView!
	private var login: UILabel!
	private var avatar: UIImageView!
	private var type: UILabel!
	
	var user: User
	
	init(user: User) {
		self.user = user
		self.detailViewLayout = DetailViewLayout()
		self.networkService = NetworkManager()
		self.serviceViewModel = ServiceViewModel(networkService: networkService)
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
    }
	
	override func viewDidLayoutSubviews() {
		setupLayout()
	}
	
	private func setupView() {
		container = detailViewLayout.container
		login = detailViewLayout.login
		avatar = detailViewLayout.avatar
		type = detailViewLayout.type
		populateView()
	}
	
	private func setupLayout() {
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
	
	func populateView() {
		login?.text = user.login
		serviceViewModel?.loadDetailImage(with: user.avatarURL, imageView: avatar)
		type?.text = user.type
	}

}
