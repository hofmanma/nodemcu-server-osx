//
//  StreamServer.swift
//  NodeMCU
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa
import SwiftSocket

class StreamServer: NSObject {

    let connection: ServerConnection
    
    init( _ connection: ServerConnection! ) {
        
        self.connection = connection
    }
    
    func net() -> ServerConnection! {
        
        return connection
    }
    
    func accept() -> StreamClient! {
        
        return createClient( connection.accept() );
    }
    
    func createClient( _ socket: TCPClient! ) -> StreamClient! {
        
        return StreamClient( ClientConnection( socket: socket ) )
    }
}
