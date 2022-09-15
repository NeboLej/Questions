//
//  String.swift
//  Questions
//
//  Created by Nebo on 12.06.2022.
//

import Foundation

extension String
{
    public var urlPath: String {
        let comps = components(separatedBy: "/");
        if comps[0].contains("http") {
            return comps[3..<(comps.count - 1)].joined( separator: "/" )
        }
        return comps[(comps[0].isEmpty ? 1 : 0)..<(comps.count - 1)].joined( separator: "/" )
    }
    
    public var lastURLComponent: String {
        return components(separatedBy: "/").last ?? "";
    }
}
