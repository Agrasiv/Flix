//
//  UpcomingMovieLocalObject.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import FMDB

class UpcomingMovieLocalObject {
    
    static let sharedInstance = UpcomingMovieLocalObject()
    
    let db = Database.sharedInstance.openUserDb()
    let tableName = "upcomingMovie"
    var id = 0
    var title = ""
    var image = ""
    var favourite = false
    var overview = ""
    var date = ""
    
    func checkUpcomingMovieTableCreatedInDb(db: FMDatabase) -> Bool {
        let createStr = String(format: "CREATE TABLE IF NOT EXISTS '%@' ('id' VARCHAR PRIMARY KEY  NOT NULL UNIQUE, 'title' VARCHAR, 'image' VARCHAR, 'favourite' BOOLEAN, 'overview' VARCHAR, 'date' VARCHAR)", tableName)
        let worked = db.executeStatements(createStr)
        print("Create Table: \(tableName) Success!")
        return worked
    }
    
    func insertMovie() {
        _ = self.checkUpcomingMovieTableCreatedInDb(db: db!)
        let sql = String(format: "INSERT INTO '%@' (id, title, image, favourite, overview, date) VALUES (?,?,?,?,?,?)", tableName)
        let _ = db!.executeUpdate(sql, withArgumentsIn: [self.id, self.title, self.image, self.favourite, self.overview, self.date])
        print("Insert Table \(tableName) Success!")
    }
    
    func fetchAllUpcomingMovies() -> [UpcomingMovieLocalObject] {
        var resultArray = [UpcomingMovieLocalObject]()
        _ = self.checkUpcomingMovieTableCreatedInDb(db: db!)
        let sql = "select * from upcomingMovie"
        guard let rs = db?.executeQuery(sql, withArgumentsIn: []) else { return [] }
        while rs.next() {
            let movies = UpcomingMovieLocalObject()
            self.movieFromDataset(obj: movies, rs: rs)
            resultArray.append(movies)
        }
        rs.close()
        return resultArray
    }
    
    func updateFavMovie(isFavourtie: Bool, movieId: Int) -> Bool {
        _ = self.checkUpcomingMovieTableCreatedInDb(db: db!)
        let sql = String(format: "UPDATE upcomingMovie SET favourite = ? WHERE id = ?", tableName)
        let worked = db?.executeUpdate(sql, withArgumentsIn: [isFavourtie, movieId])
        return worked ?? false
    }
    
    private func movieFromDataset(obj: UpcomingMovieLocalObject, rs: FMResultSet) {
        obj.id = Int(rs.int(forColumn: "id"))
        obj.title = rs.string(forColumn: "title") ?? ""
        obj.image = rs.string(forColumn: "image") ?? ""
        obj.favourite = (rs.bool(forColumn: "favourite"))
        obj.overview = rs.string(forColumn: "overview") ?? ""
        obj.date = rs.string(forColumn: "date") ?? ""
    }
}
