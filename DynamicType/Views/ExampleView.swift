//
//  ExampleView.swift
//  DynamicType
//
//  Created by Kane Cheshire on 22/03/2018.
//  Copyright © 2018 The App Business. All rights reserved.
//

import UIKit

struct ExampleViewModel {
	
	let title: String
	let detail: String
	let message: String
	
}

final class ExampleView: UIView {
	
	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var detailLabel: UILabel!
	@IBOutlet private var messageLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupDynamicType()
		updateFonts()
	}
	
	func configure(with viewModel: ExampleViewModel, traitCollection: UITraitCollection = UIScreen.main.traitCollection) {
		titleLabel.text = viewModel.title
		detailLabel.text = viewModel.detail
		messageLabel.text = viewModel.message
		updateFonts(with: traitCollection)
		// Pro-tip: this is a really good time to update accessibility
	}
	
	private func setupDynamicType() {
		titleLabel.adjustsFontForContentSizeCategory = true
		detailLabel.adjustsFontForContentSizeCategory = true
		messageLabel.adjustsFontForContentSizeCategory = true
	}
	
	private func updateFonts(with traitCollection: UITraitCollection = UIScreen.main.traitCollection) {
		titleLabel.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 20, weight: .heavy), compatibleWith: traitCollection)
		detailLabel.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 20, weight: .bold), compatibleWith: traitCollection)
		messageLabel.font = UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 17, weight: .regular), compatibleWith: traitCollection)
	}
	
}
