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
	private var output: MockServiceViewModelOutput!

	override func setUpWithError() throws {
		output = MockServiceViewModelOutput()
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
		// Given
		let user = User(login: "Usman", avatarURL: "https://www.picsum.com/2", type: "User")
		networkService.getMockData = .success([user])
		
		// When
		serviceViewModel.fetchData(searchQuery: "Usman", page: 1)
		output.updateViews(with: [user])
		
		// Then
		XCTAssertEqual(output.updateViewsArray.count, 1)
		XCTAssertEqual(output.updateViewsArray[0].login, "Usman")
		XCTAssertEqual(output.updateViewsArray[0].avatarURL, "https://www.picsum.com/2")
		XCTAssertEqual(output.updateViewsArray[0].type, "User")
	}
	
	func testUpdateViews_onAPIFailure() {
		// Given
		networkService.getMockData = .failure(NSError())
		
		// When
		serviceViewModel.fetchData(searchQuery: "Usman", page: 1)
		output.updateViews(with: [])
		
		// Then
		XCTAssertEqual(output.updateViewsArray.count, 0)
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

class MockServiceViewModelOutput: ServiceViewModelOutput {
	var updateViewsArray: [User] = []
	
	func updateViews(with data: [User]) {
		updateViewsArray = data
	}
	
	
}
