<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
  
  <% a = attribute.name.split('_') -%>
  <% if a.count > 1 -%>
  belongs_to :<%= a.last %><%= ', polymorphic: true' if attribute.polymorphic? %>
    <% else -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
<% end -%>

<% end -%>

  def name
    "#{nombre}"   
  end

end
<% end -%>

