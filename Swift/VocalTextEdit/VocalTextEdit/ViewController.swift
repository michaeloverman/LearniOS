//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Michael Overman on 9/16/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        if let contents = textView.string {
            speechSynthesizer.startSpeaking(string: contents)
        } else {
            speechSynthesizer.startSpeaking("The document is empty.")
        }
    }

    @IBAction func stopButtonClicked(sender: NSButton) {
        print("The stop button was clicked.")
    }

}

