//
//  serviceViewModel.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import Foundation
import Kingfisher

protocol ServiceViewModelOutput: AnyObject {
	func updateViews(with data: [User])
}

class ServiceViewModel {
	
	weak var output: ServiceViewModelOutput?
	private let networkService: NetworkService
	
	init(networkService: NetworkService) {
		self.networkService = networkService
	}
	
	public func validateQuery(query: String) -> Bool {
		var isValid: Bool
		if query.count != 0 {
			isValid = true
		} else {
			isValid = false
		}
		return isValid
	}
	
	public func fetchData(searchQuery: String?, page: Int) {
		if validateQuery(query: searchQuery ?? "user") {
			Constants.search_query = searchQuery ?? ""
		} else {
			return
		}
		Constants.page = page
		networkService.networkRequest { [weak self] result in
			switch result {
				case .success(let userData):
					let data = userData.sorted{ $0.login.lowercased() < $1.login.lowercased() }
					let filteredData = data.filter({ $0.login.contains(searchQuery ?? "") })
					self?.output?.updateViews(with: data)
					Constants.total_page = data.count / Constants.per_page
					if data.count % Constants.per_page != 0 {
						Constants.total_page += 1
					}
				case .failure:
					print("An error occured: ", LocalizedError.self)
			}
		}
	}
	
	public func loadImage(with url: String, imageView: UIImageView?) {
		let imageLink = URL(string: url)
		let processor = DownsamplingImageProcessor(size: imageView?.bounds.size ?? CGSize(width: 200, height: 188))
					 |> RoundCornerImageProcessor(cornerRadius: 50)
		imageView?.kf.indicatorType = .activity
		imageView?.kf.setImage(
			with: imageLink,
			placeholder: UIImage(named: "plaeholder"),
			options: [
				.processor(processor),
				.scaleFactor(UIScreen.main.scale),
				.transition(.fade(1)),
				.cacheOriginalImage
			])
		{
			result in
			switch result {
			case .success(let value):
				print("Task done for: \(value.source.url?.absoluteString ?? "")")
			case .failure(let error):
				print("Job failed: \(error.localizedDescription)")
			}
		}
	}
	
	public func loadDetailImage(with url: String, imageView: UIImageView?) {
		let imageLink = URL(string: url)
		imageView?.kf.setImage(with: imageLink)
	}
	
}
