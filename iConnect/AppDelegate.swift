//
//  AppDelegate.swift
//  iConnect
//
//  Created by 邓泽西 on 2017/2/6.
//  Copyright © 2017年 ecp. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: -2)
    var state = true
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "Bone")
            button.action = #selector(AppDelegate.printQuote(sender: ))
        }
        
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(AppDelegate.printQuote(sender: )), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(AppDelegate.quit(sender: )), keyEquivalent: "q"))
        
        statusItem.menu = menu
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func printQuote(sender: AnyObject) {
        if(state){
            statusItem.button?.image = NSImage(named: "Bone_complete")
            state = false
        }
        else{
            statusItem.button?.image = NSImage(named: "Bone")
            state = true
        }
    }
    
    func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}

