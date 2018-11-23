//
//  User.swift
//  restAPIMV
//
//  Created by Hilton Pintor Bezerra Leite on 23/11/18.
//  Copyright © 2018 Hilton Pintor Bezerra Leite. All rights reserved.
//

import Foundation

typealias Users = [User]

struct User: Decodable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: TypeEnum?
    let siteAdmin: Bool?
}

enum TypeEnum: String, Decodable {
    case organization = "Organization"
    case user = "User"
}
