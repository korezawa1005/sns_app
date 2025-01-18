class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    posts_path # ログイン後のリダイレクト先
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path # ログアウト後のリダイレクト先
  end
end
