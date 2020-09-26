//
//  News.swift
//  NewsApp
//
//  Created by Mahesh Prasad on 22/09/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import Foundation

struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct NewsEnvelope: Decodable {
    let status: String
    let totalResults: Int
    let article:[News]
}
