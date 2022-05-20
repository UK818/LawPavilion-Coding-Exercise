//
//  Service.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import Foundation

final class NetworkManager {
	
	static let shared = NetworkManager()
	
	func networkRequest(completionHandler: @escaping ([User]) -> Void) {
		guard let url = URL(string: Constants.getURL()) else { return }
		let task = URLSession.shared.task(with: url) { data, _, error in
			if let data = data {
				completionHandler(data.items)
			}
			
			if let error = error {
				print("Error is : ", error)
			}
		}
		task.resume()
		
	}
	
}
