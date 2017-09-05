//
//  GameViewController.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene()
        // set the scene to the view
        sceneView.scene = scene
        
        // Configure lighting / camera nodes
        initLightsAndCamera(scene)
        
        // Load Model into scene
//        updateModel()
        attachShader(scene)

        
        // allows the user to manipulate the camera
        sceneView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // configure the view
        sceneView.backgroundColor = UIColor(hue: 0.22, saturation: 0.22, brightness: 0.22, alpha: 1.0)
        sceneView.isPlaying = true
        sceneView.loops = true
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
        sceneTechnique(named: "drops_technique",setupCompletion: { technique in
            technique?.setValue(NSValue(cgSize: self.view.frame.size.applying(CGAffineTransform(scaleX: 1.5, y: 1.5))), forKeyPath: "size_screen")
        })
        
//        sceneTechnique(named: "sobel_technique") { (technique) in
//            technique?.setValue(NSValue(cgSize: self.view.frame.size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))), forKeyPath: "size_screen")
//        }
    }
    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // check what nodes are tapped
        let p = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: nil)
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result: AnyObject! = hitResults[0]
            
            // get its material
            let material = result.node!.geometry!.firstMaterial!
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}


extension GameViewController {
    func initLightsAndCamera(_ scene: SCNScene) {
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLight.LightType.omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
    }
    
    func attachShader(_ scene: SCNScene) {
        let shaderDataSource = ShadersDataSource()
        
        guard let geometryShaderSettings = shaderDataSource.geometrySettings.items.last as? ShaderSettingItem else {
            return
        }

        var shaderModifiers = [SCNShaderModifierEntryPoint : String]()
        shaderModifiers[SCNShaderModifierEntryPoint.geometry] = geometryShaderSettings.shaderProgram
        
        let sphere = SphereNode()
        sphere.applyShader(shaderModifiers: shaderModifiers)
        scene.rootNode.addChildNode(sphere.node)
    }
    
    
    /// Loads and applies a scene technique to the main scene view
    ///
    /// - Parameter technique: name of the destiantion scene technique
    func sceneTechnique(named technique: String, setupCompletion: (_ techqnieus: SCNTechnique?)->Void) {
        if let path = Bundle.main.path(forResource: technique, ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                let forcedUnwrappedDict = dict as! [String : AnyObject]
                let technique = SCNTechnique(dictionary:forcedUnwrappedDict)
                setupCompletion(technique)
                sceneView.technique = technique
            }
        }
    }
}

