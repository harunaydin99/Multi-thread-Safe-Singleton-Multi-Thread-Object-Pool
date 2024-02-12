//
//  ViewController.swift
//  YazilimTasarimKaliplari1
//
//  Created by Harun AYDIN on 28.03.2022.
//

import UIKit

class ViewController: UIViewController {
    let queue1 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue2 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue3 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue4 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue5 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue6 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue7 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue8 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue9 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue10 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue11 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue12 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue13 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue14 = DispatchQueue(label: "Queue", attributes: .concurrent)
    let queue15 = DispatchQueue(label: "Queue", attributes: .concurrent)
    
    let mainQueue = DispatchQueue(label: "mainQueue")
    let lock = NSLock()
    var queues: [DispatchQueue] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        queues = [queue1,queue2,queue3,queue4,queue5,queue6,queue7,queue8,queue9,queue10,queue11,queue12,queue13,queue14,queue15]
        PoolManager.createObject().fillPool()
        
        
        for queue in self.queues {
           // self.lock.lock()
            queue.async{
                
                while true {
                    if let con = PoolManager.createObject().takeConnection() {
                        con.connect()
                        PoolManager.createObject().releaseConnection(con: con)
                        break
                    } else {
                        sleep(2)
                    }
                }
            }
           // self.lock.unlock()
        }
  
    }

}

