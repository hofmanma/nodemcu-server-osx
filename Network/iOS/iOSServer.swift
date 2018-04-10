//
//  BloenkServer.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa
import SwiftSocket

class iOSServer: StreamServer {
    
    override func createClient( _ socket: TCPClient! ) -> StreamClient! {
        
        return iOSListener( ClientConnection( socket: socket ) )
    }
}
