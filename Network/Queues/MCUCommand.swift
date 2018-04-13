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
    static let lock: NSLock! = NSLock()
    
    init( _ cmd: String! ) {
        
        self.cmd = cmd
    }
    
    func command() -> String! {
        
        return cmd
    }
    
    func send() {
        
        MCUCommand.lock.lock()
        do {
            
            try Session.shared.user.sendCommand( cmd )
        } catch {
            
            MCUCommand.lock.unlock()
        }
    }
    
    func isLocked() -> Bool! {
        
        return MCUCommand.lock.try()
    }
}
