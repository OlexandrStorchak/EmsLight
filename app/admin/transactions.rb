ActiveAdmin.register Transaction do
  permit_params :author_id, :description, :occured_at, :account_id, :agent_id, :category_id, :project_id

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :description
      f.input :occured_at, :as => :date_select, :selected => Date.today
      f.input :author_id, :as => :select, :collection => AdminUser.pluck(:first_name, :id),
                          :prompt => "Please select", :selected => current_admin_user
      f.input :account, :prompt => "Please select"

      f.input :agent, :prompt => "Please select"

      f.input :category, :prompt => "Please select"
      f.input :project, :prompt => "Please select"
    end
    f.actions
  end
end
