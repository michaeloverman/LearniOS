//
//  Document.swift
//  VocalTextEdit
//
//  Created by Michael Overman on 9/16/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        
        let contents = viewController.textView.string ?? ""
        
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
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

