//
//  ViewController+Extension.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDataSource {
	
	func collectionViewSetup() {
		collectionView.dataSource = self
		collectionView.delegate = self
		
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return userData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.populateCell(with: userData[indexPath.row])
		cell.layer.borderWidth = 1
		cell.layer.borderColor = CGColor(red: 0.3, green: 0.3, blue: 0.9, alpha: 1)
		cell.layer.cornerRadius = 25
		return cell
	}

}

extension HomeViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let vc = DetailViewController()
		vc.populateView(with: userData[indexPath.row])
		present(vc, animated: true)
	}
	
}

extension HomeViewController {
	func layOutConstraint() {
		NSLayoutConstraint.activate([
			searchView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
			searchView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
			searchView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
			searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			searchTextView.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
			searchTextView.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor),
			searchTextView.heightAnchor.constraint(equalToConstant: 45),
			
			searchButton.leadingAnchor.constraint(equalTo: searchTextView.trailingAnchor),
			searchButton.widthAnchor.constraint(equalToConstant: 60),
			searchButton.heightAnchor.constraint(equalToConstant: 45),
			
			collectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 30),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
			collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
			collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.85),
			collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
			
		])
	}
}
