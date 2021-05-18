//
//  NetworkManager.swift
//  Sun & Sand
//
//  Created by Nimit Bagadiya on 18/05/21.
//

import Foundation

typealias ResponseData<T: Codable> = (_ baseModel: BaseModel<T>?,_ error: CustomError?) -> Void

class NetworkManager {
    static var shared: NetworkManager {
        guard let manager = networkManager else {
            networkManager = NetworkManager()
            return networkManager!
        }
        return manager
    }
    
    static private var networkManager: NetworkManager?
    
    private init() {}
    
    
    /// This api is used to call GET api.
    /// - Parameters:
    ///   - stringUrl: <#stringUrl description#>
    ///   - completion: <#completion description#>
    func get<T>(stringUrl: String, completion: @escaping ResponseData<T>) where T : Codable {
        
        // This will check whether string is valid for URL or not. if not then it will stop there and give callback of error
        guard let url = URL(string: AppUrls.v1BaseURL + stringUrl) else {
            completion(nil, CustomError.other("Invalid URL"))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else{
                if error?.localizedDescription == "The request timed out." {
                    completion(nil, CustomError.noInternetFound)
                }else{
                    completion(nil, CustomError.other("Something went wrong, please try after sometime."))
                }
                return
            }
            do {
                // Data parsing
                let json = try JSONDecoder().decode(BaseModel<T>.self, from: data)
                completion(json, nil)
            }catch(let error) {
                // Getting parsing error here
                debugPrint(error)
                completion(nil, CustomError.dataParsingError)
            }
        }
        session.resume()
    }
}
