//
//  feature.swift
//  ProjectDescriptionHelpers
//
//  Created by Hosung Lim on 4/11/24.
//

import ProjectDescription

let nameAttribute: Template.Attribute = .required("feature")

let template = Template(
	description: "This is a template for feature layer",
	attributes: [
		nameAttribute
	],
	items: [

	]
)
