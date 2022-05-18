//
//  ViewLayout.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 12/05/2022.
//

import Foundation
import UIKit

public class HomeViewLayout {
	
	let searchView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing
		stackView.layer.borderWidth = 1
		stackView.layer.cornerRadius = 15
		return stackView
	}()
	
	let searchTextView: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Search"
		textField.enablesReturnKeyAutomatically = true
		return textField
	}()
	
	let searchButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.tintColor = .blue
		button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
		return button
	}()
	
	let collectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 160, height: 200)
		layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
		layout.scrollDirection = .vertical
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(
			CollectionViewCell.self,
			forCellWithReuseIdentifier: CollectionViewCell.identifier
		)
		return collectionView
	}()
	
	let userView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = 10
		return stackView
	}()
	
	let loginLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		return label
	}()
	
	let avatar: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "plaeholder")
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let typeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}()
	
}
