//
//  Document.swift
//  VocalTextEdit
//
//  Created by Michael Overman on 9/16/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    var contents: String = ""
    
    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        
        let contents = viewController.contents ?? ""
        
        if let data = contents.data(using: String.Encoding.utf8) {
            return data
        } else {
            let userInfo = [
                NSLocalizedRecoverySuggestionErrorKey: "File cannot bet encoded in UTF-8."
            ]
            throw NSError(domain: "com.bignerdranch.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }

    override func read(from data: Data, ofType typeName: String) throws {
        if let contents = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
//            // WARNING
//            let windowController = windowControllers[0]
//            let viewController = windowController.contentViewController as! ViewController
//            viewController.textView.string = contents
            self.contents = contents
            return
        } else {
            let userInfo = [ NSLocalizedRecoverySuggestionErrorKey: "File is not valid UTF-8" ]
            throw NSError(domain: "com.bignerdranch.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }


}

