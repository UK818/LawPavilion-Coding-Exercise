//
//  URLSession+Extension.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import Foundation

// MARK: - URLSession response handlers
extension URLSession {
	fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		return self.dataTask(with: url) { data, response, error in
			guard let data = data, error == nil else {
				completionHandler(nil, response, error)
				return
			}
			
			let responseData = try? newJSONDecoder().decode(T.self, from: data)
			completionHandler(responseData, response, nil)
		}
	}

	func task(with url: URL, completionHandler: @escaping (SearchResult?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		return self.codableTask(with: url, completionHandler: completionHandler)
	}
}
