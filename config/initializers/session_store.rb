if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_blog_app", domain: "dh-blog-app.herokuapp.com" 
else
  Rails.application.config.session_store :cookie_store, key: "_blog_app"
end