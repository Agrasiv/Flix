//
//  PopularMovieLocalObject.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import FMDB

class PopularMovieLocalObject {
    
    static let sharedInstance = PopularMovieLocalObject()
    
    let db = Database.sharedInstance.openUserDb()
    let tableName = "popularMovie"
    var id = 0
    var title = ""
    var image = ""
    
    func checkPopularMovieTableCreatedInDb(db: FMDatabase) -> Bool {
        let createStr = String(format: "CREATE TABLE IF NOT EXISTS '%@' ('id' VARCHAR PRIMARY KEY  NOT NULL UNIQUE, 'title' VARCHAR, 'image' VARCHAR)", tableName)
        let worked = db.executeStatements(createStr)
        print("Create Table: \(tableName) Success!")
        return worked
    }
    
    func insertPopularMovie() {
        _ = self.checkPopularMovieTableCreatedInDb(db: db!)
        let sql = String(format: "INSERT INTO '%@' (id, title, image) VALUES (?,?,?)", tableName)
        let _ = db!.executeUpdate(sql, withArgumentsIn: [self.id, self.title, self.image])
        print("Insert Table \(tableName) Success!")
    }
    
    func fetchAllPopularMovies() -> [PopularMovieLocalObject] {
        var resultArray = [PopularMovieLocalObject]()
        _ = self.checkPopularMovieTableCreatedInDb(db: db!)
        let sql = "select * from popularMovie"
        guard let rs = db?.executeQuery(sql, withArgumentsIn: []) else { return [] }
        while rs.next() {
            let movies = PopularMovieLocalObject()
            self.movieFromDataset(obj: movies, rs: rs)
            resultArray.append(movies)
        }
        rs.close()
        return resultArray
    }
    
    private func movieFromDataset(obj: PopularMovieLocalObject, rs: FMResultSet) {
        obj.id = Int(rs.int(forColumn: "id"))
        obj.title = rs.string(forColumn: "title") ?? ""
        obj.image = rs.string(forColumn: "image") ?? ""
    }
    
}


