//
//  DetailViewLayout.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 16/05/2022.
//

import Foundation
import UIKit

public class DetailViewLayout {
	
	let container: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = 10
		return stackView
	}()
	
	let login: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		label.textAlignment = .center
		return label
	}()
	
	let avatar: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	let type: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
		label.textAlignment = .center
		return label
	}()
	
}
