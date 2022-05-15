//
//  Constants.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import Foundation

enum Constants {
	
	static var searchQuery: String = ""
	static let baseURL = "https://api.github.com/"
	static func getURL() -> String { "\(baseURL)search/users?q=\(searchQuery)" }
	
//	static let giphyApiKey = "lVKYZAM1Ni7MvPA613oBP1qwc7ihzgFU"
//	static let getTrendingGifURL = "\(baseURL)trending?api_key=\(giphyApiKey)"
//	static func getGifByIDURL(id: String) -> String { "\(baseURL)\(id)?api_key=\(giphyApiKey)" }
//	static func getGifSearched(searchText:String) -> String { "\(baseURL)search?q=\(searchText)&api_key=\(giphyApiKey)" }
	
	
	
}
