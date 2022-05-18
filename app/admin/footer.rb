module ActiveAdmin
  ActiveAdmin::Views::Footer.class_eval do
    def build(namespace)
      super id: "footer"
      span "EMS light #{Date.today.year}"
    end
  end
end
