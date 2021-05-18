//
//  User.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation

// MARK: - Result
struct User: Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let dob, registered: Dob?
    let phone, cell: String?
    let id: ID?
    let picture: Picture?
    let nat: String?
    
    var fullName: String {
        return (name?.first ?? "") + " " + (name?.last ?? "")
    }
    
    var userGender: String {
        return gender ?? ""
    }
    
    var thumbNailString: String {
        return picture?.thumbnail ?? ""
    }
    
    var largeString : String {
        return picture?.large ?? ""
    }
    
    var address: String {
        return "\(location?.street?.name ?? ""), \(location?.city ?? ""), \(location?.state ?? ""), \(location?.country ?? "")"
    }
}

// MARK: - Dob
struct Dob: Codable {
    let date: String?
    let age: Int?
}

// MARK: - ID
struct ID: Codable {
    let name, value: String?
}

// MARK: - Location
struct Location: Codable {
    let street: Street?
    let city, state, country: String?
    let coordinates: Coordinates?
    let timezone: Timezone?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String?
}

// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, timezoneDescription: String?

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String?
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String?
}
