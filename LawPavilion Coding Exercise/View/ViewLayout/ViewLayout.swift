//
//  ViewLayout.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 12/05/2022.
//

import Foundation
import UIKit

public class ViewLayout {
	
	let searchView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing
		stackView.spacing = 10
		stackView.layer.borderWidth = 1
		stackView.layer.cornerRadius = 15
		return stackView
	}()
	
	let searchTextView: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Search"
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
		let collectionView = UICollectionView()
		return collectionView
	}()
	
	let loginLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let image: UIImage = {
		let image = UIImage()
		return image
	}()
	
	let typeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
}
