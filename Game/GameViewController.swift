//
//  GameViewController.swift
//  Game
//
//  Created by Holden Thompson on 7/23/24.
//
import SceneKit
import QuartzCore

class GameViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Try to create a new scene
        guard let scene = SCNScene(named: "art.scnassets/Porygon.scn") else {
            print("Failed to load scene")
            return
        }
        
        // Try to retrieve the porygon node
        guard let porygon = scene.rootNode.childNode(withName: "Porygon", recursively: true) else {
            print("Porygon node not found")
            return
        }
        
        // Animate the 3d object
        porygon.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
        
        // Retrieve the SCNView
        guard let scnView = self.view as? SCNView else {
            print("View is not an SCNView")
            return
        }
        
        // Set the scene to the view
        scnView.scene = scene
        
        // Allow the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // Show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // Configure the view
        scnView.backgroundColor = NSColor.black
    }
}
