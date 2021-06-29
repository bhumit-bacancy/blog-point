<% if logged_in? && (a.user == current_user || current_user.admin?) %>
                            <%= link_to "Edit",edit_article_path(a),class:"btn btn-outline-info" %>
                            <%= link_to "Delete",article_path(a),method: :Delete, data:{confirm: "are you sure?!"},class:"btn btn-outline-danger" %>
                        <% end %>