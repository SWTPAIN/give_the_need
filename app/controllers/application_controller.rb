class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :commitment_response_tag

  def commitment_response_tag(commitment, type)
    if type == 'pending_receipt'
      view_context.link_to post_commitment_path(commitment.post, commitment, receiver_response: true), method: :patch do
        view_context.content_tag(:button, "Success", class: "btn btn-primary btn-xs")
      end
      view_context.link_to post_commitment_path(commitment.post, commitment, receiver_response: false), method: :patch do
        view_context.content_tag(:button, "Failure", class: "btn btn-danger btn-xs")
      end
    elsif type == 'pending_giving'
      view_context.link_to post_commitment_path(commitment.post, commitment, giver_response: true), method: :patch do
        view_context.content_tag(:button, "Success", class: "btn btn-primary btn-xs")
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username,:image) }
  end
end
