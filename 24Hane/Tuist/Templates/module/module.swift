import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
  desctiption: "A template for creating a new module.",
  attributes: [
    nameAttribute,
    .optional("platform", default: "ios"),
  ],
  items: [
    .string(
      path: "Project.swift",
      content: "My template for \(nameAttribute) module."
    ),
    .file(
      path: 
    ),
    .directory(),
  ]
)
