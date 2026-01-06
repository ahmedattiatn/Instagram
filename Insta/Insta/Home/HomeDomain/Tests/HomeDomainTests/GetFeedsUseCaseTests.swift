
//
//  GetFeedsUseCaseTests.swift
//  InstaTests
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Factory
import XCTest
@testable import Insta

final class GetFeedsUseCaseTests: XCTestCase {
    // MARK: Internal

    // MARK: - TearDown

    override func tearDown() {
        Container.shared.homeRepository.reset()
        homeRepositoryMock = nil
        sut = nil
        super.tearDown()
    }

    // MARK: - Tests

    func test_GetFeeds_Success() async throws {
        // GIVEN
        let fakeFeeds = FeedResponse.fake()
        homeRepositoryMock = HomeRepositoryMock(feedResult: .success(fakeFeeds))
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        sut = GetFeedsUseCase()

        // WHEN
        let feeds = try await sut()

        // THEN
        XCTAssertNotNil(feeds)
        XCTAssertEqual(feeds?.count, fakeFeeds.feeds.count)
        XCTAssertEqual(feeds?.first?.user.id, 1)
    }

    func test_GetFeeds_ReturnsNilWhenRepositoryReturnsNil() async throws {
        // GIVEN
        homeRepositoryMock = HomeRepositoryMock(feedResult: .success(nil))
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        sut = GetFeedsUseCase()

        // WHEN
        let feeds = try await sut()

        // THEN
        XCTAssertNil(feeds)
    }

    func test_GetFeeds_FailureThrowsError() async throws {
        enum FakeError: Error { case failed }

        // GIVEN
        homeRepositoryMock = HomeRepositoryMock(feedResult: .failure(FakeError.failed))
        Container.shared.homeRepository.register { self.homeRepositoryMock }
        sut = GetFeedsUseCase()

        // THEN
        do {
            _ = try await sut()
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertTrue(error is FakeError)
        }
    }

    // MARK: Private

    private var homeRepositoryMock: HomeRepositoryMock!
    private var sut: GetFeedsUseCase!
}
