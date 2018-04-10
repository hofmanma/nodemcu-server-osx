//
//  Logger.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 10.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class Logger: NSObject {

    var content: String! = ""
    
    func addError( _ error: Error! ) {
        
        addDashLine()
        addLine( "An Exception" )
        addLine( error.localizedDescription )
    }
    
    func addLine( _ text: String! ) {
        
        addText( text )
        addReturn()
    }
    
    func addText( _ text: String! ) {
    
        content = content + text;
    }
    
    func all() -> String! {
    
        return content
    }
    
    func reset() {
        
        content = ""
    }
    
    func addDashLine() {
    
        addLine( "---------------------------------" );
    }
    
    private func addReturn() {
        
        content = content + "\r"
    }
}
