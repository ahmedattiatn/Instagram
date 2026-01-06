
//
//  HomeViewModelTests.swift
//  InstaTests
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Factory
import XCTest
@testable import Insta

final class HomeViewModelTests: XCTestCase {
    // MARK: Internal

    // MARK: - Setup / Teardown

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        Container.shared.homeRepository.reset()
        viewModel = nil
        homeRepositoryMock = nil
        super.tearDown()
    }

    // MARK: - Load Feeds

    func test_loadFeeds_success() async throws {
        // GIVEN
        let fake = FeedResponse.fake()
        homeRepositoryMock = HomeRepositoryMock(
            feedResult: .success(fake)
        )
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        viewModel = await HomeViewModel()

        await MainActor.run {
            XCTAssertTrue(viewModel.feeds.isEmpty)
            XCTAssertEqual(viewModel.homeViewState, HomeViewState.empty)
        }

        // WHEN
        await viewModel.loadFeeds()

        // THEN
        await MainActor.run {
            XCTAssertFalse(viewModel.feeds.isEmpty)
            XCTAssertEqual(viewModel.homeViewState, HomeViewState.loadedContent)
        }
    }
    

    // MARK: Private

    private var viewModel: HomeViewModel!
    private var homeRepositoryMock: HomeRepositoryMock!
}
