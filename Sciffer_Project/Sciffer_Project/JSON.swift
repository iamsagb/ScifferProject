//
//  JSON.swift
//  Sciffer_Project
//
//  Created by Sagar Bhosale on 23/05/22.
//

import Foundation

// MARK: - MoviesList
struct MoviesList: Codable {
    let movieList: [MovieList]

    enum CodingKeys: String, CodingKey {
        case movieList = "Movie List"
    }
}

// MARK: - MovieList
struct MovieList: Codable {
    let title, year, summary, shortSummary: String
    let genres, imdbid, runtime: String
    let youTubeTrailer: String?
    let rating: String
    let moviePoster: String
    let director, writers, cast: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case summary = "Summary"
        case shortSummary = "Short Summary"
        case genres = "Genres"
        case imdbid = "IMDBID"
        case runtime = "Runtime"
        case youTubeTrailer = "YouTube Trailer"
        case rating = "Rating"
        case moviePoster = "Movie Poster"
        case director = "Director"
        case writers = "Writers"
        case cast = "Cast"
    }
}
