//
//  Database.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 13/10/2024.
//

import Foundation
import FMDB

class Database {
    
    static let sharedInstance = Database()
    var db: FMDatabase?
    
    func openUserDb() -> FMDatabase? {
        let t = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let s = String(format: "%@/localUser1%@.db", t)
        db = FMDatabase(path: s)
        if let db = db, !db.open() {
            return nil
        }
        return db
    }
}
