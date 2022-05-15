//
//  DataModel.swift
//  LawPavilion Coding Exercise
//
//  Created by mac on 15/05/2022.
//

import Foundation

// MARK: - Welcome
struct SearchResult: Codable {
	let totalCount: Int
	let incompleteResults: Bool
	let items: [Item]

	enum CodingKeys: String, CodingKey {
		case totalCount = "total_count"
		case incompleteResults = "incomplete_results"
		case items
	}
}

// MARK: - Item
struct Item: Codable {
	let login: String
	let avatarURL: String
	let url: String
	let type: String

	enum CodingKeys: String, CodingKey {
		case login
		case avatarURL = "avatar_url"
		case url
		case type
	}
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
	let decoder = JSONDecoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		decoder.dateDecodingStrategy = .iso8601
	}
	return decoder
}

func newJSONEncoder() -> JSONEncoder {
	let encoder = JSONEncoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		encoder.dateEncodingStrategy = .iso8601
	}
	return encoder
}

