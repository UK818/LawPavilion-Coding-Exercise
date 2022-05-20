//
//  ViewController.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 12/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
	let serviceViewModel = ServiceViewModel()
	private let viewLayout = HomeViewLayout()
	
	var searchView: UIStackView!
	var searchTextView: UITextField!
	var searchButton: UIButton!
	var collectionView: UICollectionView!
	var introLabel: UILabel!
	var userData = [User]()
	var currentPage: Int = 1
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewSetup()
	}
	
	fileprivate func viewSetup() {
		searchView = viewLayout.searchView
		searchTextView = viewLayout.searchTextView
		searchButton = viewLayout.searchButton
		collectionView = viewLayout.collectionView
		introLabel = viewLayout.mainLabel
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
	
	@objc func initiateSearch() {
		let searchQuery = searchTextView.text
		let isValidQuery: Bool
		isValidQuery = serviceViewModel.validateQuery(query: searchQuery ?? "")
		if isValidQuery {
			self.serviceViewModel.fetchData(searchQuery: searchQuery, page: currentPage) { [weak self] result in
				DispatchQueue.main.async {
					self?.userData = result
					self?.collectionView.reloadData()
					if self?.userData.count ?? 0 < 1 {
						self?.collectionView.isHidden = true
						self?.introLabel.isHidden = false
						self?.introLabel.text = "No results"
					} else {
						self?.introLabel.isHidden = true
						self?.collectionView.isHidden = false
						self?.collectionView.reloadData()
					}
				}
			}
		} else {
			self.collectionView.isHidden = true
			self.introLabel.isHidden = false
			self.introLabel.text = "type in user's name"
		}
	}

}

