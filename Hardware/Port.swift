//
//  Port.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 12.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class Port: NSObject {

    let id: Int
    var value: Float
    var mode: Int
    
    init( _ id: Int!, _ value: Float! ) {
    
        self.id = id
        self.value = value
        self.mode = 1
    }
    
    func toString() -> String! {
        
        return ioMode() + " \(value)"
    }
    
    func setSignal( _ value: Float! ) {
        
        self.value = value
    }

    func setMode( _ value: Int! ) {
        
        self.mode = value
    }

    func signal() -> Float! {
        
        return self.value
    }
    
    func ioMode() -> String! {
        
        switch self.mode{
        
        case Int(DefaultObjects.MODE_PORT_INPUT):
            return ">"
            
        case Int(DefaultObjects.MODE_PORT_OUTPUT):
            return "<"
        
        default:
            return "?"
        }
    }
}
