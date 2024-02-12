//
//  Connection.swift
//  YazilimTasarimKaliplari1
//
//  Created by Harun AYDIN on 31.03.2022.
//

import Foundation

class Connection : Database {
    
    init(){
        
    }
    let lock = NSLock()
    func connect() {
        //lock.lock()
        print("bağlantı açıldı")
        sleep(5)
        print("bağlantı kapandı")
        sleep(1)
        //lock.unlock()
    }
    
    
}
