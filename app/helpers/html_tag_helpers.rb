helpers do
  def em(content)
    "<em>#{content}</em>"
  end

  # model --> contact
  # field --> :name
  def text_field(model, field)
    <<-HTML
                  <!-- "contact_name"                 --> <!-- Name -->
    <label for="#{model.class.name.underscore}_#{field}">#{field.to_s.titleize}</label>
    <!--          contact_name-->
    <input id="#{model.class.name.underscore}_#{field}" type="text" name="#{model.class.name.underscore}[#{field}]" value="#{model[field]}" />
    HTML
  end
end
