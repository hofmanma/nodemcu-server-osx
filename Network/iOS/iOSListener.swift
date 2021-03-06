//
//  BloenkClient.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class iOSListener: StreamClient {

    override func handleCommand (  _ cmd: String! ) throws {
        
        if isValid( cmd ) {
            
            try passToMCU( cmd )
            
        } else {
         
            try self.net().writeString( DefaultObjects.STATUS_ERROR )
            
            Session.shared.logger.addLine( "Unknown Command in iOS Client." )
        }
    }
    
    private func isValid( _ cmd: String! ) -> Bool! {
        
        if cmd == DefaultObjects.CMD_NONE {
            
            return true
        } else if cmd == DefaultObjects.CMD_LED_ON {
            
            return true
        } else if cmd == DefaultObjects.CMD_LED_OFF {
            
            return true
        } else if cmd == DefaultObjects.CMD_EXIT {
            
            return true
        } else if cmd == DefaultObjects.CMD_READ_TEMPERATURE {
            
            return true
        } else if cmd == DefaultObjects.CMD_READ_HUMIDITY {
            
            return true
        } else if cmd == DefaultObjects.CMD_ANALOG_PORTS {
            
            return true
        } else if cmd == DefaultObjects.CMD_DIGITAL_PORTS {
            
            return true
        } else if cmd == DefaultObjects.CMD_PORTS {
            
            return true
        } else if cmd == DefaultObjects.CMD_ANALOG_PORT_OUT {
        
            return true
        } else if cmd == DefaultObjects.CMD_ANALOG_PORT_IN {
            
            return true
        } else if cmd == DefaultObjects.CMD_ANALOG_PORT_HIGH {
            
            return true
        } else if cmd == DefaultObjects.CMD_ANALOG_PORT_LOW {
            
            return true
        } else if cmd == DefaultObjects.CMD_DIGITAL_PORT_OUT {
            
            return true
        } else if cmd == DefaultObjects.CMD_DIGITAL_PORT_IN {
            
            return true
        } else if cmd == DefaultObjects.CMD_DIGITAL_PORT_HIGH {
            
            return true
        } else if cmd == DefaultObjects.CMD_DIGITAL_PORT_LOW {
            
            return true
        } else if cmd == DefaultObjects.CMD_TRACKING {
    
            return true
        } else {
            
            return false
        }
    }
    
    private func passToMCU( _ cmd: String! ) throws {
        
        Session.shared.MCU.run( { MCU in
            
            do {
            
                try MCU.net().writeString( cmd );
            
            } catch {

                Session.shared.logger.addLine( "Passed to Arduino failed." )
                Session.shared.logger.addError( error )
                
                try self.net().writeString( DefaultObjects.STATUS_ERROR )
                
                return
            }
            
            try self.net().writeString( DefaultObjects.STATUS_SUCCESS )
        })
    }
}
