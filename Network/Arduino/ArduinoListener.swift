//
//  MCUClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class ArduinoListener: StreamClient {
    
    override func handleCommand( _ cmd: String! ) throws {
        
        Session.shared.logger.addLine( "New Command from Arduino Client: " + cmd )
        if cmd == DefaultObjects.CMD_PORTS {
            
            for port in 0...8 {
                
                NodeMCU.IC.digitalPort( port ).setSignal( Float(connection.readInt()) )
            }
            
            for port in 0...8 {
                
                NodeMCU.IC.analogPort( port ).setSignal( Float(connection.readInt()) )
            }
            
            Session.shared.logger.addLine( "Ports successfully read." )
            
        } else if cmd == DefaultObjects.CMD_DIGITALPORT_SENT {
            
            let port: Int! = connection.readInt()
            let io: Int! = connection.readInt()
            let signal: Float! = connection.readFloat()
            
            NodeMCU.IC.digitalPort( port ).setSignal( signal )
            NodeMCU.IC.digitalPort( port ).setMode( io )
            
        } else if cmd == DefaultObjects.CMD_ANALOGPORT_SENT {
            
            NodeMCU.IC.analogPort( connection.readInt() ).setSignal( connection.readFloat() )
        }
    }
}
