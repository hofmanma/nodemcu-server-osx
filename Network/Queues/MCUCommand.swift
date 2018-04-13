//
//  MCUCommand.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 13.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class MCUCommand: NSObject {

    let cmd: String
    
    init( _ cmd: String! ) {
        
        self.cmd = cmd
    }
    
    func command() -> String! {
        
        return cmd
    }
    
    func send() throws {
        
        try Session.shared.user.sendCommand( cmd )
    }
}
