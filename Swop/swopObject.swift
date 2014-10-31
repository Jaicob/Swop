//
//  swopObject.swift
//  Swop
//
//  Created by Jaicob Stewart on 9/30/14.
//  Copyright (c) 2014 Jaicob Stewart. All rights reserved.
//

import Foundation
import SpriteKit

let swopSize = CGSizeMake(28, 28)

class SwopObject {
  
  enum Direction : String{
    case Unknown = "unknown"
    case up = "up"
    case down = "down"
    case left = "left"
    case right = "right"
  }
  
  var sprite: SKSpriteNode
  var type: Direction
  var winPosition: CGPoint
  var startPosition: CGPoint
  var startRow: Int
  var startCol: Int
  var row: Int;
  var col: Int;
  
  init(){
    sprite = SKSpriteNode(color: SKColor.grayColor(), size: swopSize)
    type = Direction.Unknown
    winPosition = CGPointZero
    startPosition = CGPointZero
    row = 0;
    col = 0;
    startRow = 0;
    startCol = 0;
  }
  
  init(sprite: SKSpriteNode, type: Direction, winPosition: CGPoint, row: Int, col: Int){
    self.sprite = sprite
    self.type = type
    self.winPosition = winPosition
    self.startRow = row
    self.startCol = col
    self.startPosition = CGPointZero
    self.row = row;
    self.col = col;
  }
  
  convenience init(sprite: SKSpriteNode, type: Direction){
    self.init(sprite: sprite,type: type,winPosition: CGPointZero,row: 0,col: 0)
  }
  
  convenience init(type: Direction, winPosition: CGPoint){
    self.init(sprite: SKSpriteNode(color: SKColor.grayColor(), size: swopSize),type: type,winPosition: CGPointZero,row: 0,col: 0)
  }
  
  convenience init(sprite: SKSpriteNode){
    self.init(sprite: sprite,type: Direction.Unknown, winPosition: CGPointZero,row: 0,col: 0);
  }
  
}