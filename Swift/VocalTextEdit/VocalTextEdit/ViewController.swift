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
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue ?? ""
        }
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        if let contents = textView?.string, !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        } else {
            speechSynthesizer.startSpeaking("The document is empty.")
        }
    }

    @IBAction func stopButtonClicked(sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }

}

