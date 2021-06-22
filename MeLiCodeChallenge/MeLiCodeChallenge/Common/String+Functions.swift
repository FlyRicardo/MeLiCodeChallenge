//
//  String+Functions.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 22/06/21.
//

import Foundation

extension String {

    public func localized(inContext context: Any, withComment comment: String = "") -> String {
        let bundle = Bundle(for: type(of: context as AnyObject))
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle, comment: comment)
    }
    
}
