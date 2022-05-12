//
//  ViewController.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 12/05/2022.
//

import UIKit

class ViewController: UIViewController {
	let layout = ViewLayout()
	
	var searchView: UIStackView!
	var searchTextView: UITextField!
	var searchButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		searchView = layout.searchView
		searchTextView = layout.searchTextView
		searchButton = layout.searchButton
		
		view.addSubview(searchView)
		searchView.addArrangedSubview(searchTextView)
		searchView.addArrangedSubview(searchButton)
		
		searchView.center = view.center
		layOutConstraint()
	}
	
	func layOutConstraint() {
		NSLayoutConstraint.activate([
			searchView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
			searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			searchView.heightAnchor.constraint(equalToConstant: 60),
			
			searchTextView.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
			searchTextView.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor),
			searchTextView.heightAnchor.constraint(equalToConstant: 60),
			searchTextView.widthAnchor.constraint(equalToConstant: searchView.frame.width - 80),
			
			searchButton.widthAnchor.constraint(equalToConstant: 60),
			searchButton.heightAnchor.constraint(equalToConstant: 60)
		])
	}
	
	@objc func initiateSearch() {
		//Search
	}

}

