ActiveAdmin.register AdminUser do
  menu parent: "System", priority: 4
  config.sort_order = "last_name_asc"

  permit_params :email, :password, :password_confirmation, :first_name, :last_name

  filter :first_name
  filter :last_name
  filter :email
  filter :created_at

  index do
    selectable_column
    id_column
    column :role
    column :first_name
    column :last_name
    column :email
    actions
  end

  show do
    panel "User" do
      table_for admin_user do
        column :role
        column :first_name
        column :last_name
        column :email
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  sidebar :details, only: :show do
    attributes_table_for admin_user do
      row :created_at
      row :updated_at
    end
  end
end
