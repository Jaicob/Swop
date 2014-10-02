//
//  Level.swift
//  Swop
//
//  Created by Jaicob Stewart on 9/30/14.
//  Copyright (c) 2014 Jaicob Stewart. All rights reserved.
//

import Foundation
import SpriteKit

class Level {
  
  var objects = [[SwopObject?]]()
  var tiles = [[SKSpriteNode]]()
  
  init() {
    //could make array of optionals and fill values later
    initializeObjects()
    initializeTiles()
    //    resetSwopObjects()
  }
  
  func resetSwopObjects() {
    for var i = 0; i < objects.count; i++ {
      for var j = 0; j < objects[0].count; j++ {
        if (objects[i][j] != nil) {
        objects[i][j]!.sprite.position =  CGPointMake(CGFloat(j*30),0.5)
        objects[i][j]!.winPosition = CGPointMake(CGFloat(objects.count*30 - j*30), 0.5)
        }
      }
    }
  }
  
  func initializeTiles(){
    for var i = 0; i < 1; i++ {
      for var j = 0; j < 7; j++ {
        var node = SKSpriteNode(color: SKColor.blackColor(), size: CGSizeMake(30, 28))
        node.position = CGPointMake(CGFloat(j*30),0.5)
        tiles.append(([(node)]))
      }
    }
  }
  
  func initializeObjects() {
    for var i = 0; i < 1; i++ {
      for var j = 0; j < 7; j++ {
        var obj: SwopObject? = SwopObject()
        if j <= 2 {
          obj?.type = SwopObject.Direction.right
        }
        else if j >= 4 {
          obj?.type = SwopObject.Direction.left
        }
        obj!.sprite.position =  CGPointMake(CGFloat(j*30),0.5)
        obj!.winPosition = CGPointMake(CGFloat(objects.count*30 - i*30), 0.5)
        if j == 3 {
          obj = nil
        }
        objects.append(([(obj)]))

      }
    }
  }
  
  func detectWinState() -> Bool {
    for objectArray in objects {
      for object in objectArray {
        if let currentObject = object {
          if currentObject.sprite.position != currentObject.winPosition {
            return false
          }
        }
      }
    }
    return true
  }
  
  func movePosition(object: SwopObject) -> CGPoint?{
    var newPosition: CGPoint? = nil
    var adjacentPosition = CGPointMake(object.sprite.position.x + 30, object.sprite.position.y)
    var hopPosition = CGPointMake(object.sprite.position.x + 60, object.sprite.position.y)
    var adjacentObject: Bool  = objectAtPosition(adjacentPosition).0
    var hopObject: Bool = objectAtPosition(hopPosition).0
    
    if !adjacentObject {
      newPosition = adjacentPosition
    } else if(!hopObject) {
      newPosition = hopPosition
    }
    return newPosition
  }
  

  
   func objectAtPosition(position: CGPoint) -> (Bool, SwopObject?) {
    for objectArray in objects {
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
  
}