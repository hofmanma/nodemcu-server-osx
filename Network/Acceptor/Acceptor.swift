//
//  Bloenk.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

typealias ResponseHandler = (_ client: StreamClient ) throws -> Void

class Acceptor: NSObject {
    
    var clients: [StreamClient]! = [StreamClient]()
    var running: Bool!
    var server: StreamServer!

    init( _ i: Int! ) throws {
    
        super.init()
        
        try accept()
    }
    
    func accept() throws {

        shutDown()
    }
    
    func run( _ withHandler: @escaping ResponseHandler ) {
        
        for client in clients {
            
            do {
            
                try withHandler( client );
            
            } catch {
                
            }
        }
    }
    
    func stop() {
        
        running = false
    }
    
    private func shutDown() {
        
        for client in self.clients {
            
            client.net().close();
        }
        
        self.clients.removeAll()
    }
    
    func hasClients() -> Bool! {
        
        return clients.count > 0
    }
    
    func isRunning() -> Bool! {
        
        return running
    }
}
