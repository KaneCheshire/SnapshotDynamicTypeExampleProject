//
//  UIView+NibLoadable.swift
//  DynamicType
//
//  Created by Kane Cheshire on 22/03/2018.
//  Copyright © 2018 The App Business. All rights reserved.
//

import UIKit

protocol UIViewLoading {}
extension UIView: UIViewLoading {}

extension UIViewLoading where Self : UIView {
	
	static func nib(named: String? = nil) -> UINib {
		let nibName = named ?? "\(classForCoder())"
		return UINib(nibName: nibName, bundle: Bundle(for: self))
	}
	
	static func loadFromNib(_ nibNameOrNil: String? = nil) -> Self {
		return nib(named: nibNameOrNil).instantiate(withOwner: self, options: nil).first as! Self
	}
	
}
