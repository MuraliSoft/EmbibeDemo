//
//  RepoDetailsModel.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Foundation

struct RepoDetailsModel: Codable {
    var id: Int?
    var state: String?
    var title: String?
    var user: UserDetailsModel?
    var body: String?
    var createdAt, updatedAt, closedAt, mergedAt: String?
  
    enum CodingKeys: String, CodingKey {
        case id, state, title, user, body
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case mergedAt = "merged_at"
    }
}
