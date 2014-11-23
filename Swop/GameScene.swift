//
//  GameScene.swift
//  Swop
//
//  Created by Jaicob Stewart on 9/30/14.
//  Copyright (c) 2014 Jaicob Stewart. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  var level: Level!
  var tileLayer = SKNode()
  var objectLayer = SKNode()
  let gameLayer = SKNode()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  func setup() {
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    let layerPosition = CGPoint(
      x: -30 * CGFloat(7) / 2,
      y: -30 * CGFloat(1) / 2)
    
    addChild(gameLayer)
    
    tileLayer.position = layerPosition
    gameLayer.addChild(tileLayer)
    
    objectLayer.position = layerPosition
    gameLayer.addChild(objectLayer)
  }
  
  override func didMoveToView(view: SKView) {
    /* Setup your scene here */
  }
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
  
  func drawTiles() {
    for tileArray in level.tiles {
      for tile in tileArray {
        tileLayer.addChild(tile)
      }
    }
  }
  
  func drawObjects() {
    objectLayer.removeAllChildren()
    var i = 0
    for objectArray in level.objects {
      for object in objectArray {
        if object != nil {
          object?.sprite.name = object?.type.rawValue
          objectLayer.addChild(object!.sprite)
          println(object!.type.rawValue)
          i++
        }
      }
    }
  }
  
  func moveObject(object : SwopObject) {
    println("moving object with position: \(object.sprite.position)\n Win Position: \(object.winPosition)")
    switch object.type {
    case .right:
      println("move to the right")
      object.sprite.position = movePosition(object)!
    case .left:
      println("move to the left")
      object.sprite.position = movePosition(object)!
    default:
      println("Dont move")
    }
  }
  
  func movePosition(object: SwopObject) -> CGPoint?{
    var newPosition: CGPoint? = object.sprite.position
    var adjacentPosition: CGPoint?
    var hopPosition: CGPoint?
    
    switch object.type {
    case .left:
      println("left pos")
      adjacentPosition = CGPointMake(object.sprite.position.x - 30, object.sprite.position.y)
      hopPosition = CGPointMake(object.sprite.position.x - 60, object.sprite.position.y)
    case .right:
      println("right pos")
      adjacentPosition = CGPointMake(object.sprite.position.x + 30, object.sprite.position.y)
      hopPosition = CGPointMake(object.sprite.position.x + 60, object.sprite.position.y)
      
    default:
      println("no pos")
    }
    
    var adjacentObject: Bool  = objectAtPosition(adjacentPosition!).0
    var hopObject: Bool = objectAtPosition(hopPosition!).0
    
    if !adjacentObject {
      newPosition = adjacentPosition
    } else if(!hopObject) {
      newPosition = hopPosition
    }
    level.moveIndex(object)
    return newPosition
  }
  
  func objectAtPosition(position: CGPoint) -> (Bool, SwopObject?) {
    for objectArray in self.level.objects {
      for object in objectArray {
        if let currentObject = object {
          if currentObject.sprite.position == position {
            return (true, currentObject)
          }
        }
      }
    }
    return (false,nil)
  }

  
  
  func animateMoveForClearPath() {
    
  }
  
  func animateMoveForHop() {
    
  }
  
  func animateInvalideMove() {
    
  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    var touch = touches.anyObject() as UITouch
    var selectedNode = self.nodeAtPoint(touch.locationInNode(self));
    //if selectedNode.name == "SwopObject"{
    var swopObject: SwopObject? = objectAtPosition(selectedNode.position).1
    if let object = swopObject {
      moveObject(object)
    }
    var winState = self.level.detectWinState()
    println("WIN STATE:\(winState)")

  }
  
}
