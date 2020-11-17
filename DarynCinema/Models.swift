//
//  Models.swift
//  DarynCinema
//
//  Created by nagato on 10/16/20.
//  Copyright © 2020 nagato. All rights reserved.
//

import Foundation
import ObjectMapper

class UsersResponse : NSObject, NSCoding, Mappable{

    var response : Bool?
    var search : [Search]?
    var totalResults : String?


    class func newInstance(map: Map) -> Mappable?{
        return UsersResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        response <- map["Response"]
        search <- map["Search"]
        totalResults <- map["totalResults"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         response = aDecoder.decodeObject(forKey: "Response") as? Bool
         search = aDecoder.decodeObject(forKey: "Search") as? [Search]
         totalResults = aDecoder.decodeObject(forKey: "totalResults") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if response != nil{
            aCoder.encode(response, forKey: "Response")
        }
        if search != nil{
            aCoder.encode(search, forKey: "Search")
        }
        if totalResults != nil{
            aCoder.encode(totalResults, forKey: "totalResults")
        }

    }

}
class Search : NSObject, NSCoding, Mappable{

    var poster : String?
    var title : String?
    var type : String?
    var year : String?
    var imdbID : String?


    class func newInstance(map: Map) -> Mappable?{
        return Search()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        poster <- map["Poster"]
        title <- map["Title"]
        type <- map["Type"]
        year <- map["Year"]
        imdbID <- map["imdbID"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         poster = aDecoder.decodeObject(forKey: "Poster") as? String
         title = aDecoder.decodeObject(forKey: "Title") as? String
         type = aDecoder.decodeObject(forKey: "Type") as? String
         year = aDecoder.decodeObject(forKey: "Year") as? String
         imdbID = aDecoder.decodeObject(forKey: "imdbID") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if poster != nil{
            aCoder.encode(poster, forKey: "Poster")
        }
        if title != nil{
            aCoder.encode(title, forKey: "Title")
        }
        if type != nil{
            aCoder.encode(type, forKey: "Type")
        }
        if year != nil{
            aCoder.encode(year, forKey: "Year")
        }
        if imdbID != nil{
            aCoder.encode(imdbID, forKey: "imdbID")
        }

    }

}
class UsersResponse1 : NSObject, NSCoding, Mappable{

    var page : Int?
    var results : [Result]?
    var totalPages : Int?
    var totalResults : Int?


    class func newInstance(map: Map) -> Mappable?{
        return UsersResponse1()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        page <- map["page"]
        results <- map["results"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         page = aDecoder.decodeObject(forKey: "page") as? Int
         results = aDecoder.decodeObject(forKey: "results") as? [Result]
         totalPages = aDecoder.decodeObject(forKey: "total_pages") as? Int
         totalResults = aDecoder.decodeObject(forKey: "total_results") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if page != nil{
            aCoder.encode(page, forKey: "page")
        }
        if results != nil{
            aCoder.encode(results, forKey: "results")
        }
        if totalPages != nil{
            aCoder.encode(totalPages, forKey: "total_pages")
        }
        if totalResults != nil{
            aCoder.encode(totalResults, forKey: "total_results")
        }

    }

}
class Result : NSObject, NSCoding, Mappable{

    var adult : Bool?
    var backdropPath : String?
    var genreIds : [Int]?
    var id : Int?
    var originalLanguage : String?
    var originalTitle : String?
    var overview : String?
    var popularity : Float?
    var posterPath : String?
    var releaseDate : String?
    var title : String?
    var video : Bool?
    var voteAverage : Float?
    var voteCount : Int?


    class func newInstance(map: Map) -> Mappable?{
        return Result()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        genreIds <- map["genre_ids"]
        id <- map["id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        releaseDate <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         adult = aDecoder.decodeObject(forKey: "adult") as? Bool
         backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
         genreIds = aDecoder.decodeObject(forKey: "genre_ids") as? [Int]
         id = aDecoder.decodeObject(forKey: "id") as? Int
         originalLanguage = aDecoder.decodeObject(forKey: "original_language") as? String
         originalTitle = aDecoder.decodeObject(forKey: "original_title") as? String
         overview = aDecoder.decodeObject(forKey: "overview") as? String
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
         posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
         releaseDate = aDecoder.decodeObject(forKey: "release_date") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         video = aDecoder.decodeObject(forKey: "video") as? Bool
         voteAverage = aDecoder.decodeObject(forKey: "vote_average") as? Float
         voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if adult != nil{
            aCoder.encode(adult, forKey: "adult")
        }
        if backdropPath != nil{
            aCoder.encode(backdropPath, forKey: "backdrop_path")
        }
        if genreIds != nil{
            aCoder.encode(genreIds, forKey: "genre_ids")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if originalLanguage != nil{
            aCoder.encode(originalLanguage, forKey: "original_language")
        }
        if originalTitle != nil{
            aCoder.encode(originalTitle, forKey: "original_title")
        }
        if overview != nil{
            aCoder.encode(overview, forKey: "overview")
        }
        if popularity != nil{
            aCoder.encode(popularity, forKey: "popularity")
        }
        if posterPath != nil{
            aCoder.encode(posterPath, forKey: "poster_path")
        }
        if releaseDate != nil{
            aCoder.encode(releaseDate, forKey: "release_date")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if video != nil{
            aCoder.encode(video, forKey: "video")
        }
        if voteAverage != nil{
            aCoder.encode(voteAverage, forKey: "vote_average")
        }
        if voteCount != nil{
            aCoder.encode(voteCount, forKey: "vote_count")
        }

    }

}

class UsersResponse2 : NSObject, NSCoding, Mappable{

    var adult : Bool?
    var backdropPath : String?
    var budget : Int?
    var genres : [Genre]?
    var homepage : String?
    var id : Int?
    var imdbId : String?
    var originalLanguage : String?
    var originalTitle : String?
    var overview : String?
    var popularity : Float?
    var posterPath : String?
    var releaseDate : String?
    var revenue : Int?
    var runtime : Int?
    var status : String?
    var tagline : String?
    var title : String?
    var video : Bool?
    var voteAverage : Float?
    var voteCount : Int?


    class func newInstance(map: Map) -> Mappable?{
        return UsersResponse2()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        budget <- map["budget"]
        genres <- map["genres"]
        homepage <- map["homepage"]
        id <- map["id"]
        imdbId <- map["imdb_id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        releaseDate <- map["release_date"]
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        status <- map["status"]
        tagline <- map["tagline"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         adult = aDecoder.decodeObject(forKey: "adult") as? Bool
         backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
         budget = aDecoder.decodeObject(forKey: "budget") as? Int
         genres = aDecoder.decodeObject(forKey: "genres") as? [Genre]
         homepage = aDecoder.decodeObject(forKey: "homepage") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imdbId = aDecoder.decodeObject(forKey: "imdb_id") as? String
         originalLanguage = aDecoder.decodeObject(forKey: "original_language") as? String
         originalTitle = aDecoder.decodeObject(forKey: "original_title") as? String
         overview = aDecoder.decodeObject(forKey: "overview") as? String
         popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
         posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
         releaseDate = aDecoder.decodeObject(forKey: "release_date") as? String
         revenue = aDecoder.decodeObject(forKey: "revenue") as? Int
         runtime = aDecoder.decodeObject(forKey: "runtime") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? String
         tagline = aDecoder.decodeObject(forKey: "tagline") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         video = aDecoder.decodeObject(forKey: "video") as? Bool
         voteAverage = aDecoder.decodeObject(forKey: "vote_average") as? Float
         voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if adult != nil{
            aCoder.encode(adult, forKey: "adult")
        }
        if backdropPath != nil{
            aCoder.encode(backdropPath, forKey: "backdrop_path")
        }
        
        if budget != nil{
            aCoder.encode(budget, forKey: "budget")
        }
        if genres != nil{
            aCoder.encode(genres, forKey: "genres")
        }
        if homepage != nil{
            aCoder.encode(homepage, forKey: "homepage")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imdbId != nil{
            aCoder.encode(imdbId, forKey: "imdb_id")
        }
        if originalLanguage != nil{
            aCoder.encode(originalLanguage, forKey: "original_language")
        }
        if originalTitle != nil{
            aCoder.encode(originalTitle, forKey: "original_title")
        }
        if overview != nil{
            aCoder.encode(overview, forKey: "overview")
        }
        if popularity != nil{
            aCoder.encode(popularity, forKey: "popularity")
        }
        if posterPath != nil{
            aCoder.encode(posterPath, forKey: "poster_path")
        }

        if releaseDate != nil{
            aCoder.encode(releaseDate, forKey: "release_date")
        }
        if revenue != nil{
            aCoder.encode(revenue, forKey: "revenue")
        }
        if runtime != nil{
            aCoder.encode(runtime, forKey: "runtime")
        }

        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if tagline != nil{
            aCoder.encode(tagline, forKey: "tagline")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if video != nil{
            aCoder.encode(video, forKey: "video")
        }
        if voteAverage != nil{
            aCoder.encode(voteAverage, forKey: "vote_average")
        }
        if voteCount != nil{
            aCoder.encode(voteCount, forKey: "vote_count")
        }

    }

}
class Genre : NSObject, NSCoding, Mappable{

    var id : Int?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return Genre()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        name <- map["name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
class UsersResponse3 : NSObject, NSCoding, Mappable{

    var actors : String?
    var awards : String?
    var boxOffice : String?
    var country : String?
    var dVD : String?
    var director : String?
    var genre : String?
    var language : String?
    var metascore : String?
    var plot : String?
    var poster : String?
    var production : String?
    var rated : String?
    var released : String?
    var response : Bool?
    var runtime : String?
    var title : String?
    var type : String?
    var website : String?
    var writer : String?
    var year : String?
    var imdbID : String?
    var imdbRating : String?
    var imdbVotes : String?


    class func newInstance(map: Map) -> Mappable?{
        return UsersResponse3()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        actors <- map["Actors"]
        awards <- map["Awards"]
        boxOffice <- map["BoxOffice"]
        country <- map["Country"]
        dVD <- map["DVD"]
        director <- map["Director"]
        genre <- map["Genre"]
        language <- map["Language"]
        metascore <- map["Metascore"]
        plot <- map["Plot"]
        poster <- map["Poster"]
        production <- map["Production"]
        rated <- map["Rated"]
        released <- map["Released"]
        response <- map["Response"]
        runtime <- map["Runtime"]
        title <- map["Title"]
        type <- map["Type"]
        website <- map["Website"]
        writer <- map["Writer"]
        year <- map["Year"]
        imdbID <- map["imdbID"]
        imdbRating <- map["imdbRating"]
        imdbVotes <- map["imdbVotes"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         actors = aDecoder.decodeObject(forKey: "Actors") as? String
         awards = aDecoder.decodeObject(forKey: "Awards") as? String
         boxOffice = aDecoder.decodeObject(forKey: "BoxOffice") as? String
         country = aDecoder.decodeObject(forKey: "Country") as? String
         dVD = aDecoder.decodeObject(forKey: "DVD") as? String
         director = aDecoder.decodeObject(forKey: "Director") as? String
         genre = aDecoder.decodeObject(forKey: "Genre") as? String
         language = aDecoder.decodeObject(forKey: "Language") as? String
         metascore = aDecoder.decodeObject(forKey: "Metascore") as? String
         plot = aDecoder.decodeObject(forKey: "Plot") as? String
         poster = aDecoder.decodeObject(forKey: "Poster") as? String
         production = aDecoder.decodeObject(forKey: "Production") as? String
         rated = aDecoder.decodeObject(forKey: "Rated") as? String
         released = aDecoder.decodeObject(forKey: "Released") as? String
         response = aDecoder.decodeObject(forKey: "Response") as? Bool
         runtime = aDecoder.decodeObject(forKey: "Runtime") as? String
         title = aDecoder.decodeObject(forKey: "Title") as? String
         type = aDecoder.decodeObject(forKey: "Type") as? String
         website = aDecoder.decodeObject(forKey: "Website") as? String
         writer = aDecoder.decodeObject(forKey: "Writer") as? String
         year = aDecoder.decodeObject(forKey: "Year") as? String
         imdbID = aDecoder.decodeObject(forKey: "imdbID") as? String
         imdbRating = aDecoder.decodeObject(forKey: "imdbRating") as? String
         imdbVotes = aDecoder.decodeObject(forKey: "imdbVotes") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if actors != nil{
            aCoder.encode(actors, forKey: "Actors")
        }
        if awards != nil{
            aCoder.encode(awards, forKey: "Awards")
        }
        if boxOffice != nil{
            aCoder.encode(boxOffice, forKey: "BoxOffice")
        }
        if country != nil{
            aCoder.encode(country, forKey: "Country")
        }
        if dVD != nil{
            aCoder.encode(dVD, forKey: "DVD")
        }
        if director != nil{
            aCoder.encode(director, forKey: "Director")
        }
        if genre != nil{
            aCoder.encode(genre, forKey: "Genre")
        }
        if language != nil{
            aCoder.encode(language, forKey: "Language")
        }
        if metascore != nil{
            aCoder.encode(metascore, forKey: "Metascore")
        }
        if plot != nil{
            aCoder.encode(plot, forKey: "Plot")
        }
        if poster != nil{
            aCoder.encode(poster, forKey: "Poster")
        }
        if production != nil{
            aCoder.encode(production, forKey: "Production")
        }
        if rated != nil{
            aCoder.encode(rated, forKey: "Rated")
        }

        if released != nil{
            aCoder.encode(released, forKey: "Released")
        }
        if response != nil{
            aCoder.encode(response, forKey: "Response")
        }
        if runtime != nil{
            aCoder.encode(runtime, forKey: "Runtime")
        }
        if title != nil{
            aCoder.encode(title, forKey: "Title")
        }
        if type != nil{
            aCoder.encode(type, forKey: "Type")
        }
        if website != nil{
            aCoder.encode(website, forKey: "Website")
        }
        if writer != nil{
            aCoder.encode(writer, forKey: "Writer")
        }
        if year != nil{
            aCoder.encode(year, forKey: "Year")
        }
        if imdbID != nil{
            aCoder.encode(imdbID, forKey: "imdbID")
        }
        if imdbRating != nil{
            aCoder.encode(imdbRating, forKey: "imdbRating")
        }
        if imdbVotes != nil{
            aCoder.encode(imdbVotes, forKey: "imdbVotes")
        }

    }

}
