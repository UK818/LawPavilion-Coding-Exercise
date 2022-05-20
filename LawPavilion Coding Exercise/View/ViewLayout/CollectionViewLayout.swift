//
//  CollectionViewLayout.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 20/05/2022.
//

import Foundation
import UIKit

class CollectionViewLayout {
	
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
		label.numberOfLines = 2
		label.textColor = .black
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
		label.textColor = .black
		return label
	}()
	
}
