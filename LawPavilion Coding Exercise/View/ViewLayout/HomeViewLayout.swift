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
		textField.placeholder = "Search GitHub User"
		textField.tintColor = .gray
		textField.autocapitalizationType = .none
		textField.enablesReturnKeyAutomatically = true
		textField.textColor = .black
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
		layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
		layout.scrollDirection = .vertical
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor(white: 1, alpha: 0.1)
		collectionView.register(
			CollectionViewCell.self,
			forCellWithReuseIdentifier: CollectionViewCell.identifier
		)
		return collectionView
	}()
	
	let mainLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "LawPavilion Assessment Exercise"
		label.textAlignment = .center
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		return label
	}()
	
}
