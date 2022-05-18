ActiveAdmin.register Category do
  menu parent: "System", priority: 2
  permit_params :name
end
