//
//  ViewController.swift
//  NodeMCUServer
//
//  Created by Matthias Hofmann on 09.04.18.
//  Copyright © 2018 Matthias Hofmann. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textView: NSTextView!
    @IBOutlet weak var commandField: NSTextField!
                   var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }

    private func startTimer( ){
        
        guard (self.timer != nil ) else {
            
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(1),
                                              target: self,
                                              selector: (#selector(nextLoop)),
                                              userInfo: nil,
                                              repeats: true );
            return;
        }
    }
    
    private func stopTimer(){
        
        if let _ = self.timer {
            
            self.timer.invalidate();
            self.timer = nil;
        }
    }
    
    @objc func nextLoop() {
     
        textView.string = Session.shared.logger.all()
    }
    
    @IBAction func runCommand( sender: Any) {
        
        do {
        
            try Session.shared.user.sendCommand( self.commandField.stringValue )
        
            Session.shared.logger.addLine( "Command sent successfully: " + self.commandField.stringValue )
            
        } catch {
         
             Session.shared.logger.addError( error )
        }
        
        self.commandField.stringValue = ""
    }
}

