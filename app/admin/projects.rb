ActiveAdmin.register Project do
  menu parent: "System", priority: 3
  permit_params :name
end
