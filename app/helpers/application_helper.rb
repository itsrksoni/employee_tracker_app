module ApplicationHelper
    def read_only_text_field(name, method, options = {})
        text_field(name, method, :disabled => true)
  end

end
