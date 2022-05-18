ActiveAdmin.register Agent do
  menu parent: "System", priority: 1
  permit_params :name
end
