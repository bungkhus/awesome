//
//  NSObject+Extension.swift
//  Awesome
//
//  Created by Lion Parcel on 08/02/24.
//

import Foundation

extension NSObject {
  public var className: String {
    return String(describing: type(of: self))
  }
  
  public class var className: String {
    return String(describing: self)
  }
}
