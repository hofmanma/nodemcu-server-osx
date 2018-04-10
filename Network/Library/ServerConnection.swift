//
//  ServerConnection.swift
//  NodeMCU
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa
import SwiftSocket

class ServerConnection: NetConnection {

    var server: TCPServer!
    
    init( _ address: String!, _ port: Int32! ) throws {
        
        super.init()
        
        server = TCPServer(address: address, port: port )
        
        try handleResult( server.listen() )
    }
    
    func accept() -> TCPClient! {
        
        return server.accept()
    }
}
