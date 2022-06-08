//
//  LawPavilion_Coding_ExerciseTests.swift
//  LawPavilion Coding ExerciseTests
//
//  Created by mac on 25/05/2022.
//

import XCTest
@testable import LawPavilion_Coding_Exercise

class LawPavilion_Coding_ExerciseTests: XCTestCase {

	private var serviceViewModel: ServiceViewModel!
	private var networkService: MockNetworkService!

	override func setUpWithError() throws {
		networkService = MockNetworkService()
		serviceViewModel = ServiceViewModel(networkService: networkService)
		try super.setUpWithError()
	}

	override func tearDownWithError() throws {
		serviceViewModel = nil
		networkService = nil
		try super.tearDownWithError()
	}
	
	func testUpdateViews_onAPISuccess() {

	}
	
	func testUpdateViews_onAPIFailure() {
		
	}

}

class MockNetworkService: NetworkService {
	var getMockData: Result<[User], Error>?
	func networkRequest(completionHandler: @escaping (Result<[User], Error>) -> Void) {
		if let result = getMockData {
			completionHandler(result)
		}
	}
}
