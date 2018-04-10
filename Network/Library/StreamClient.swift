//
//  StreamClient.swift
//  NodeMCU
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class StreamClient: NSObject {

    let connection: ClientConnection
    
    init( _ connection: ClientConnection! ) {
        
        self.connection = connection
    }
    
    func net() -> ClientConnection! {
        
        return connection
    }
    
    func run() throws {
        
    }
    
    func nextCommand() throws -> String? {
        
        let result = try connection.readString()
        if result == nil || result == "" {
            
            return nil
        
        } else {
            
            return result
        }
    }
    
    func sendCommand( _ cmd: String! ) throws {
        
        try connection.writeString( cmd )
    }
}
