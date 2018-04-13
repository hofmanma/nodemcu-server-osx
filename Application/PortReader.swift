//
//  PortReader.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 13.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class PortReader: NSObject {

    var running: Bool!
    
    override init() {
        
        super.init()
        run()
    }
    
    func run() {
    
        running = true
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            while self.running == true {
                
                OutQueue.shared.enqueue( DefaultObjects.CMD_PORTS )
                
                sleep(5000)
            }
        }
    }
    
    func stop() {
        
        running = false
    }
}
