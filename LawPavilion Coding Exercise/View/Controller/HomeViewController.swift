//
//  ViewController.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 12/05/2022.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, ServiceViewModelOutput {
	
	let serviceViewModel: ServiceViewModel
	private let homeViewLayout: HomeViewLayout
	private let cache = KingfisherManager.shared.cache
	
	var searchView: UIStackView!
	var searchTextView: UITextField!
	var searchButton: UIButton!
	var collectionView: UICollectionView!
	var introLabel: UILabel!
	var userData = [User]()
	var currentPage: Int = 1
	
	init(serviceViewModel: ServiceViewModel, homeViewLayout: HomeViewLayout) {
		self.serviceViewModel = serviceViewModel
		self.homeViewLayout = homeViewLayout
		super.init(nibName: nil, bundle: nil)
		self.serviceViewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewSetup()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		cache.clearMemoryCache()
		cache.clearDiskCache()
		cache.cleanExpiredDiskCache()
	}
	
	fileprivate func viewSetup() {
		searchView = homeViewLayout.searchView
		searchTextView = homeViewLayout.searchTextView
		searchButton = homeViewLayout.searchButton
		collectionView = homeViewLayout.collectionView
		introLabel = homeViewLayout.mainLabel
		userData = []
		
		view.backgroundColor = UIColor(white: 1, alpha: 0.95)
		view.addSubview(searchView)
		view.addSubview(collectionView)
		view.addSubview(introLabel)
		
		searchView.addArrangedSubview(searchTextView)
		searchView.addArrangedSubview(searchButton)
		
		searchButton.addTarget(self, action: #selector(initiateSearch), for: .touchUpInside)
		searchTextView.addTarget(self, action: #selector(initiateSearch), for: .editingChanged)
		
		layOutConstraint()
		collectionViewSetup()
	}
	
	func updateViews(with data: [User]) {
		self.userData = data
		self.collectionView.reloadData()
		if self.userData.count < 1 {
			self.collectionView.isHidden = true
			self.introLabel.isHidden = false
			self.introLabel.text = "No results/invalid input"
		} else {
			self.introLabel.isHidden = true
			self.collectionView.isHidden = false
			self.introLabel.text = "successful"
			self.collectionView.reloadData()
		}
	}
	
	@objc func initiateSearch() {
		let searchQuery = searchTextView.text
		fetchUsers(searchQuery: searchQuery ?? "", page: currentPage)
	}
	
	func fetchUsers(searchQuery: String, page: Int) {
		serviceViewModel.fetchData(searchQuery: searchQuery, page: page)
	}

}

