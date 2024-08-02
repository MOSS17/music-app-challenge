//
//  ArtistDetailsViewModelTests.swift
//  MusicAppTests
//
//  Created by Miguel Sandoval on 01/08/24.
//

import XCTest
@testable import MusicApp

class ArtistDetailsViewModelTests: XCTestCase {
    
    private var viewModel: ArtistDetailsViewModel!
    private var apiService: MockAPIService!
    
    override func setUp() {
        super.setUp()
        apiService = MockAPIService()
        self.viewModel = ArtistDetailsViewModel(apiService: apiService)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.apiService = nil
        super.tearDown()
    }
    
    func testNoRelatedArtistsBeforeFetch() {
        XCTAssertEqual(viewModel.relatedArtists.artists, [])
    }
    
    func testNoAlbumsBeforeFetch() {
        XCTAssertEqual(viewModel.albumsResponse.items, [])
    }
    
    func testFetchRelatedArtists() {
        viewModel.fetchRelatedArtists(artistId: "artistId")
        XCTAssertEqual(viewModel.relatedArtists.artists, Artist.mockedData)
    }
    
    func testFetchAlbums() {
        viewModel.fetchArtistAlbums(artistId: "artistId")
        XCTAssertEqual(viewModel.albumsResponse.items, Album.mockedData)
    }
    
    func testRelatedArtistDetails() async {
        viewModel.fetchRelatedArtists(artistId: "artistId")
        let artist = viewModel.relatedArtists.artists.first
        
        XCTAssertEqual(artist?.id, "4Z8W4fKeB5YxbusRsdQVPb")
        XCTAssertEqual(artist?.name, "John")
        XCTAssertEqual(artist?.images.first?.url, "https://static.wikia.nocookie.net/duckbreeds/images/0/04/CallDuckHeadshot.jpg/revision/latest?cb=20100823210932")
        XCTAssertEqual(artist?.genres, ["art rock", "alternative rock", "Mac", "SC"])
        XCTAssertEqual(artist?.followers.total, 10)
    }
    
    func testAlbumDetails() async {
        viewModel.fetchArtistAlbums(artistId: "artistId")
        let album = viewModel.albumsResponse.items.first
        
        XCTAssertEqual(album?.id, "1")
        XCTAssertEqual(album?.name, "Best Album")
        XCTAssertEqual(album?.images.first?.url, nil)
        XCTAssertEqual(album?.releaseDate, "2023-02-24")
        XCTAssertEqual(album?.totalTracks, 10)
    }
}
