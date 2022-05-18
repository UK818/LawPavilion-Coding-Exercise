//
//  ViewController.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 12/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
	private let serviceViewModel = ServiceViewModel()
	private let viewLayout = HomeViewLayout()
	
	var searchView: UIStackView!
	var searchTextView: UITextField!
	var searchButton: UIButton!
	var collectionView: UICollectionView!
	var userData = [User]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewSetup()
	}
	
	fileprivate func viewSetup() {
		searchView = viewLayout.searchView
		searchTextView = viewLayout.searchTextView
		searchButton = viewLayout.searchButton
		collectionView = viewLayout.collectionView
		userData = []
		
		view.addSubview(searchView)
		view.addSubview(collectionView)
		
		searchView.addArrangedSubview(searchTextView)
		searchView.addArrangedSubview(searchButton)
		
		searchButton.addTarget(self, action: #selector(initiateSearch), for: .touchUpInside)
		searchTextView.addTarget(self, action: #selector(initiateSearch), for: .editingChanged)
		
//		if userData.count < 1 {
//			view.addSubview(<#T##view: UIView##UIView#>)
//		}
		
		layOutConstraint()
		collectionViewSetup()
	}
	
	@objc func initiateSearch() {
		//Search
		let searchQuery = searchTextView.text
		self.serviceViewModel.fetchData(searchQuery: searchQuery) {[weak self] result in
			DispatchQueue.main.async {
				self?.userData = result
				self?.collectionView.reloadData()
			}
		}
	}

}

