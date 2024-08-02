//
//  HomeViewModelTest.swift
//  MusicAppTests
//
//  Created by Miguel Sandoval on 01/08/24.
//

import XCTest
@testable import MusicApp

final class HomeViewModelTest: XCTestCase {
    private var viewModel: HomeViewModel!
    private var apiService: MockAPIService!
    private var failViewModel: HomeViewModel!
    private var failApiService: MockAPIFailService!
    
    override func setUp() {
        super.setUp()
        apiService = MockAPIService()
        failApiService = MockAPIFailService()
        self.viewModel = HomeViewModel(apiService: apiService)
        self.failViewModel = HomeViewModel(apiService: failApiService)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.apiService = nil
        super.tearDown()
    }
    
    func testNoArtistsBeforeFetch() {
        XCTAssertEqual(viewModel.artistResponse.artists, [])
    }
    
    func testFetchArtist() async {
        await viewModel.fetchArtists()
        XCTAssertEqual(Artist.mockedData, viewModel.artistResponse.artists)
    }
    
    func testFetchArtistFail() async {
        await failViewModel.fetchArtists()
        XCTAssertEqual(viewModel.artistResponse.artists, [])
    }
    
    func testRequestTokenSuccess() async {
        let expectation = XCTestExpectation(description: "request token service is successful")
        
        apiService.requestAndSaveToken { completion in
            switch completion {
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
    }
    
    func testRequestTokenFail() async {
        let expectation = XCTestExpectation(description: "request token service fails")
        
        failApiService.requestAndSaveToken { completion in
            switch completion {
            case .success:
                XCTFail()
            case .failure:
                expectation.fulfill()
            }
        }
    }
    
    func testArtistDetails() async {
        await viewModel.fetchArtists()
        let artist = viewModel.artistResponse.artists.first
        
        XCTAssertEqual(artist?.id, "4Z8W4fKeB5YxbusRsdQVPb")
        XCTAssertEqual(artist?.name, "John")
        XCTAssertEqual(artist?.images.first?.url, "https://static.wikia.nocookie.net/duckbreeds/images/0/04/CallDuckHeadshot.jpg/revision/latest?cb=20100823210932")
        XCTAssertEqual(artist?.genres, ["art rock", "alternative rock", "Mac", "SC"])
        XCTAssertEqual(artist?.followers.total, 10)
    }
}
