class Application::Cell < Cell::Concept
  include ::Cell::Slim

  include ApplicationHelper
  include ::Rails.application.routes.url_helpers

  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::OutputSafetyHelper
  include ActionDispatch::Http::Cache::Request
  include ActionView::RecordIdentifier
  include SimpleForm::ActionViewExtensions::FormHelper
  include WillPaginate::ActionView

  include AbstractController::Helpers
  include Devise::Controllers::Helpers
  include Ransack::Helpers::FormHelper

  def render_each_and_join(views)
    views.inject('') { |partials, view| partials << render("partials/#{view}") }
  end

  def self.date_property(*array)
    array.each do |prop|
      define_method(prop) do
        I18n.l model.public_send(prop), format: :short
      end
    end
  end

  def pagination
    will_paginate(model, renderer: BootstrapPagination::Rails)
  end

  def cart
    concept("cart/cell")
  end
end
