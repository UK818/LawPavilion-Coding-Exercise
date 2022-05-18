//
//  serviceViewModel.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import Foundation
import Kingfisher

class ServiceViewModel {
	
	public func fetchData(searchQuery: String?, completion: @escaping ([User]) -> Void) {
		if searchQuery != nil, searchQuery != "" {
			Constants.searchQuery = searchQuery ?? ""
			NetworkManager.shared.networkRequest {[weak self] result in
				DispatchQueue.main.async {
					completion(result.sorted{$0.login.lowercased() < $1.login.lowercased()})
				}
				
			}
		} else {
			print("NO QUERY")
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
