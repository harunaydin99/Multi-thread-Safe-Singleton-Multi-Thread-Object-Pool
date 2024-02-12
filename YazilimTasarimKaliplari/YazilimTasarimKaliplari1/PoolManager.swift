//
//  PoolManager.swift
//  YazilimTasarimKaliplari1
//
//  Created by Harun AYDIN on 31.03.2022.
//

import Foundation

class PoolManager {
    
    static var poolManager:PoolManager?

    let con1 = Connection()
    let con2 = Connection()
    let con3 = Connection()
    let con4 = Connection()
    let con5 = Connection()
    let con6 = Connection()
    let con7 = Connection()
    let con8 = Connection()
    let con9 = Connection()
    let con10 = Connection()
    var connections : [Connection] = []
    let poolLock = NSLock()
    static let poolLock2 = NSLock()
    
    
    private init(){}
    
    
    
    func fillPool() {
        connections = [con1,con2,con3,con4,con5,con6,con7,con8,con9,con10]
    }
    
    static func createObject() -> PoolManager {
        poolLock2.lock()
        if poolManager == nil {
            poolManager = PoolManager()
        }
        poolLock2.unlock()
        return poolManager!
        
    }
    
    
    func takeConnection() -> Connection? {
        poolLock.lock()
       // print(connections.count)
        if connections.count == 0 {
            print("maalesef connection yok...Lütfen bekleyiniz...\n")
            poolLock.unlock()
            return nil
        } else {
            
            let connect = connections.first
            connections.removeFirst()
            poolLock.unlock()
            return connect
        }
        
    }
    
    
    func releaseConnection(con : Connection) {
        poolLock.lock()
        connections.append(con)
        poolLock.unlock()
    }

    
    
}
