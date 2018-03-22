//
//  DynamicTypeSnapshotTests.swift
//  DynamicTypeSnapshotTests
//
//  Created by Kane Cheshire on 22/03/2018.
//  Copyright © 2018 The App Business. All rights reserved.
//

import PixelTest
@testable import DynamicType

class DynamicTypeSnapshotTests: PixelTestCase {
	
	override func setUp() {
		super.setUp()
		mode = .test // Change this to `.record` when creating new snapshots.
	}
	
	func test_simpleData() throws {
		let view = ExampleView.loadFromNib() // This is a helper function you can find in the main target
		let viewModel = ExampleViewModel(title: "Hello World", detail: "Foo", message: "Bar")
		view.configure(with: viewModel)
		try verify(view, layoutStyle: .dynamicHeight(fixedWidth: 320))
	}
	
	func test_longData() throws {
		let view = ExampleView.loadFromNib()
		let viewModel = ExampleViewModel(title: "Sed posuere consectetur est at lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", detail: "Cras mattis consectetur purus sit amet fermentum. Donec ullamcorper nulla non metus auctor fringilla. Donec id elit non mi porta gravida at eget metus. Sed posuere consectetur est at lobortis. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.", message: "Maecenas sed diam eget risus varius blandit sit amet non magna. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec ullamcorper nulla non metus auctor fringilla. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id ligula porta felis euismod semper.")
		view.configure(with: viewModel)
		try verify(view, layoutStyle: .dynamicHeight(fixedWidth: 320))
	}
	
	func test_extraSmallDynamicType() throws {
		let view = ExampleView.loadFromNib()
		let viewModel = ExampleViewModel(title: "Hello World", detail: "Foo", message: "Bar")
		let traitCollection = UITraitCollection(preferredContentSizeCategory: .extraSmall)
		view.configure(with: viewModel, traitCollection: traitCollection)
		try verify(view, layoutStyle: .dynamicHeight(fixedWidth: 320))
	}
	
	func test_accessibilityExtraExtraExtraLargeDynamicType() throws {
		let view = ExampleView.loadFromNib()
		let viewModel = ExampleViewModel(title: "Hello World", detail: "Foo", message: "Bar")
		let traitCollection = UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)
		view.configure(with: viewModel, traitCollection: traitCollection)
		try verify(view, layoutStyle: .dynamicHeight(fixedWidth: 320))
	}
	
}
