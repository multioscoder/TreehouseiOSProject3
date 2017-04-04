//
//  Events.swift
//  Project 3
//
//  Created by Mohamed Al Mohannadi on 4/3/17.
//  Copyright © 2017 Mohamed Al Mohannadi. All rights reserved.
//

import Foundation
import GameplayKit

struct Event {
    var year: Int
    var name: String
    
}

let events: [Event] = [

Event(year: 1903, name: "Ford Motor Company"),
Event(year: 1907, name: "United Parcel Service (UPS)"),
Event(year: 1909, name: "Suzuki Motor Corporation"),
Event(year: 1911, name: "International Business Machiens (IBM)"),
Event(year: 1912, name: "Sharp Corporation"),
Event(year: 1916, name: "Bavarian Motor Works (BMW)"),
Event(year: 1923, name: "The Walt Disney Company"),
Event(year: 1924, name: "Adidas"),
Event(year: 1931, name: "Porsche"),
Event(year: 1933, name: "Nissan Motor"),
Event(year: 1935, name: "Morgan Stanley"),
Event(year: 1937, name: "Canon"),
Event(year: 1938, name: "Samsung"),
Event(year: 1939, name: "Toshiba Corporation"),
Event(year: 1946, name: "Sony"),
Event(year: 1947, name: "LG Corporation"),
Event(year: 1955, name: "McDonald's"),
Event(year: 1962, name: "Walmart"),
Event(year: 1963, name: "Comcast"),
Event(year: 1964, name: "Nike"),
Event(year: 1968, name: "Intel Corporation"),
Event(year: 1971, name: "Starbucks"),
Event(year: 1975, name: "Microsoft"),
Event(year: 1984, name: "Dell"),
Event(year: 1994, name: "Amazon"),
Event(year: 1998, name: "Google")

]



var arrayOfNumberOfEvents: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
var arrayOfNumberOfEventsSchuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: arrayOfNumberOfEvents) as? [Int]
