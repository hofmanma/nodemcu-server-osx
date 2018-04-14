//
//  OutQueue.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 13.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class OutQueue: NSObject {
    
    static let shared: OutQueue! = OutQueue()
    
           let lock: NSLock! = NSLock()
           var system: [MCUCommand]!
           var user: [MCUCommand]!
           var running: Bool!
    
    override init() {
        
        super.init()
        
        system = [MCUCommand]()
        user = [MCUCommand]()

        start()
    }
    
    func start() {
    
        running = true
        run()
    }
    
    func stop() {
        
        running = false
    }
    
    func enqueueUser( _ cmd: String! ) {
        
        user.append( MCUCommand( cmd ))
    }
    
    func enqueueSystem( _ cmd: String! ) {
        
        if system.count < 2 {

            system.append( MCUCommand( cmd ) )
        }
    }
    
    func pop() {

        unlock()
        
        if user.count > 0 {
            
            user.remove(at: 0)
        } else if system.count > 0 {

            system.remove(at: 0)
        }
    }
    
    func run() {
        
        DispatchQueue.global(qos: .userInitiated).async {
        
            while self.running == true {
            
                if let cmd = self.next() {
                
                    do {
                    
                        try cmd.send()
                    } catch {
                        
                        self.unlock()
                    }
                }
            }
            
            self.unlock()
        }
    }
    
    private func next() -> MCUCommand? {
        
        if lock.try() == false {
            
            return nil
        }
        
        if user.count > 0 {
            
            return user[ 0 ]
        } else if system.count > 0 {
            
            return system[ 0 ]
        } else {
            
            unlock()
            
            return nil
        }
    }
    
    private func unlock() {
        
        lock.unlock()
    }
}
