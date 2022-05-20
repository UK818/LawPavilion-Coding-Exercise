//
//  Constants.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import Foundation

enum Constants {
	
	static var total_page: Int = 1
	static var page: Int = 1
	static let per_page: Int = 10
	static var search_query: String = ""
	static let baseURL = "https://api.github.com/"
	static func getURL() -> String { "\(baseURL)search/users?q=\(search_query)&order=asc" }
	static func getURLwithPaginatedResult() -> String { "\(baseURL)search/users?q=\(search_query)&order=asc&per_page=\(per_page)&page=\(page)" }
	
}
