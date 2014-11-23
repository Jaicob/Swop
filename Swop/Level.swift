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
  
  //TODO: generate levels using JSON
  var objects = [[SwopObject?]]()
  var tiles = [[SKSpriteNode]]()
  var winState = [[SwopObject.Direction.self]]
  
  init() {
    initializeObjects()
    initializeTiles()
  }
  
  func resetLevel() {
    objects.removeAll(keepCapacity: false);
    initializeObjects()
    println(objects)
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
        obj?.row = i;
        obj?.col = j;
        if j <= 2 {
          obj?.type = SwopObject.Direction.right
          obj?.sprite.color = SKColor.redColor()
          
        }
        else if j >= 4 {
          obj?.type = SwopObject.Direction.left
          obj?.sprite.color = SKColor.blueColor()
          
        }
        obj!.sprite.position =  CGPointMake(CGFloat(j*30),0.5)
        obj!.startPosition = obj!.sprite.position
        obj!.winPosition = CGPointMake(CGFloat((180)-(j*30)), 0.5)
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
  
  //Moving the location in the array
  func moveIndex(object: SwopObject) -> Bool{
    var row = object.row;
    var col = object.col;
    var adjCol = col;
    var adjRow = row;
    var hopRow = row;
    var hopCol = col;
    
    switch object.type {
    case .left:
      println("left pos")
      adjCol = col-1;
      hopCol = col - 2;
    case .right:
      println("right pos")
      adjCol = col + 1;
      hopCol = col + 2;
      
    default:
      println("no pos")
      
    }
  
    //TODO: write method to check the bounds of hop and adj before going into method
    if objects[adjCol][row] == nil && adjCol < objects.count  {
      swapIndexes(adjRow, col1: adjCol, row2: row, col2: col, object: object)
      return true;
      
    } else if objects[hopCol][row] == nil && hopCol < objects.count {
      swapIndexes(hopRow, col1: hopCol, row2: row, col2: col, object: object)
      return true;
    }
    return false;
  }
  
  //TODO: Make this work
  func swapIndexes(row1: Int, col1: Int, row2: Int, col2: Int, object: SwopObject) {
    objects[col1][row1] = object
    objects[col2][row2] = nil
    object.col = col1
    object.row = row1
    println("\(self.objects) \n ")
  }
  
  func swapOptionals(row1: Int, col1: Int, row2: Int, col2: Int) {
    var swop = objects[col1][row1]
    var temp: SwopObject?
    if let swop = objects[col1][row1]? {
      var temp: SwopObject? = SwopObject(sprite: swop.sprite, type: swop.type, winPosition: swop.winPosition, row: swop.row, col: swop.col)
    }
    if objects[col1][row1] == nil {
      if let swop = objects[col2][row2]? {
        var temp: SwopObject? = SwopObject(sprite: swop.sprite, type: swop.type, winPosition: swop.winPosition, row: swop.row, col: swop.col)
      }
      objects[col1][row1] = temp
      objects[col2][row2] = nil
      
    } else if objects[col2][row2] == nil{
      if let swop = objects[col1][row1]? {
        var temp: SwopObject? = SwopObject(sprite: swop.sprite, type: swop.type, winPosition: swop.winPosition, row: swop.row, col: swop.col)
      }
      objects[col2][row2] = temp
      objects[col1][row1] = nil
    } else {
      objects[col1][row1]!.row = row1
      objects[col1][row1]!.col = col1
      objects[col2][row2]!.row = row1
      objects[col2][row2]!.col = col1
      objects[col1][row1] = objects[col2][row2]
      objects[col2][row2] = temp
    }
    
    
    
  }
  

  
}