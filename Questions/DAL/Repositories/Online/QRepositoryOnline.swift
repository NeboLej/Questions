//
//  QRepositoryOnline.swift
//  Questions
//
//  Created by Nebo on 15.09.2022.
//

import Foundation
import Alamofire
import RxSwift

class QRepositoryOnline: QRepository {
    
    let path: String
    
    init(path: String) {
        let baseURL = Bundle.main.object( forInfoDictionaryKey: "BaseDomain") as! String
        self.path = baseURL + "/" + path
    }
    func RxJSON() -> Single<JsonWrapper> {
        RxJSON(path: "", method: .get, params: nil, headers: nil)
    }
    
    func RxJSON( path: String ) -> Single<JsonWrapper> {
        RxJSON(path: path, method: .get, params: nil, headers: nil)
    }
    
    func RxJSON(path: String, method: HTTPMethod, params: [String : Any]?, headers: [String: String]?) -> Single<JsonWrapper> {
        
        return Single.create(subscribe: {
            [weak self] (subs) -> Disposable in
            if let self = self {
                let url = self.path + "/" + path
                let request = Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers)
                    .responseJSON { (response) in
                        
                    if 200..<400 ~= (response.response?.statusCode ?? 0) && response.result.isSuccess {
                            subs(.success(JsonWrapper( result: response.result.value!)))
                    } else {
                        subs( .failure( response.error ?? NSError(domain: "QError response in url: \(url)", code: response.response?.statusCode ?? 0)))
                    }
                }
                return Disposables.create { request.cancel() }
            }
            return Disposables.create()
        })
    }
}

struct JsonWrapper {
    public let result: Any
    
    /// Returns the map representation of json or empty map if json is not map convartable
    public func asMap() -> [String: Any] {
        return (result as? [String: Any]) ?? [String: Any]()
        
    }
    
    /// Returns the array representation of json or empty array if json is not array convartable
    public func asArray() -> [[String: Any]] {
        return (result as? [[String: Any]]) ?? [[String: Any]]()
    }
}

