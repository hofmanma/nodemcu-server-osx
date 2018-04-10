//
//  BloenkClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class iOSListener: StreamClient {

    override func run() throws {
        
        if let cmd = try nextCommand() {
        
            Session.shared.logger.addLine( "New Command from iOS Client: " + cmd )
        
            if cmd == DefaultObjects.CMD_LED_ON {
            
                try passToMCU( cmd )
            
            } else if cmd == DefaultObjects.CMD_LED_OFF {
            
                try passToMCU( cmd )
        
            } else {
         
                Session.shared.logger.addLine( "Unknown Command in iOS Client." )
            }
        }
    }
    
    private func passToMCU( _ cmd: String! ) throws {
        
        Session.shared.MCU.run( { MCU in
            
            do {
            
                try MCU.net().writeString( cmd );
                
                Session.shared.logger.addLine( "Command passed successfully." )
            
            } catch {

                Session.shared.logger.addLine( "Sending passed failed." )
                Session.shared.logger.addError( error )
                
                try self.net().writeString( DefaultObjects.STATUS_ERROR )
                
                return
            }
            
            try self.net().writeString( DefaultObjects.STATUS_SUCCESS )
        })
    }
}
