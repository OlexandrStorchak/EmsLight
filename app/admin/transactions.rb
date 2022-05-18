ActiveAdmin.register Transaction do
  menu priority: 3
  before_action :set_default_author_id_param, only: [:create]

  permit_params do
    params = [:description, :occured_at, :account_id, :agent_id, :category_id, :project_id]
    params.push :author_id if current_admin_user.role == "super" || action_name == "create"
    params
  end
  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :author, :as => :select, :collection => AdminUser.pluck(:first_name, :id),
                       :include_blank => false, :selected => current_admin_user.id if action_name == "new" && current_admin_user.role == "super"
      f.input :author, :as => :select, :collection => AdminUser.pluck(:first_name, :id),
                       :include_blank => false, :selected => object.author_id if action_name == "edit" && current_admin_user.role == "super"
      f.input :author, :as => :select, :collection => AdminUser.pluck(:first_name, :id),
                       :include_blank => false, :selected => current_admin_user.id if (action_name == "new" || action_name == "create") && current_admin_user.role == "user"

      f.input :account, :prompt => "Please select"
      f.input :agent, :prompt => "Please select"
      f.input :category, :prompt => "Please select"
      f.input :project, :prompt => "Please select"
      f.input :description
      f.input :occured_at, :as => :date_select, :selected => Date.today
    end
    f.actions
  end

  index do
    id_column
    column :description

    column :author
    column :account
    column :agent
    column :category
    column :project

    actions
  end
  controller do
    def set_default_author_id_param
      params[:transaction][:author_id] = current_admin_user.id if !current_admin_user.role == "super"
    end
  end
end
