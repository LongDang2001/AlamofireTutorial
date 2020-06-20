//
//  Service.swift
//  AlamofireTutorial
//
//  Created by admin on 6/19/20.
//  Copyright © 2020 Long. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    // https://restcountries.eu/rest/v2
    fileprivate var baseUrl = ""
    typealias countriesCallBack = (_ countries:[Country]?, _ status: Bool,  _ message: String) -> Void
    var callBack: countriesCallBack?
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    // MARK: getAllCountryNameFrom
    
    func getAllCountryNameFrom(endPoint: String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (reponseData) in
            print("sjdhsdjsdg")
            // Khai bao closure
            guard let data = reponseData.data else {
                self.callBack?(nil, false, "")
                return
            }
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                print("countries \(countries)")
                self.callBack?(countries, true, "")
            } catch {
                print("Error decoding == \(error)")
                self.callBack?( nil, false, error.localizedDescription)
            }
            
            
        }
    }
    func completionHandle(callBack: @escaping countriesCallBack) {
        self.callBack = callBack
    }
}
