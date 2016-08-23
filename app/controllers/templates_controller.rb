class TemplatesController < ApplicationController
  respond_to :html

  def show
    respond_to do |format|
      if template_prefixes
        format.html { render partial: template_partial }
      else
        format.html { render status: :not_found, nothing: true }
      end
    end
  end

  private

  def template_prefixes
    prefixes = []
    prefixes << ['templates', params[:prefix]].compact.join('/') if params[:prefix].present?
    prefixes << 'templates'
    prefixes.uniq.select { |prefix| lookup_context.exists?(template_name, [prefix], true) }
  end

  def template_name
    params[:name]
  end

  def template_partial
    "#{template_prefixes.first}/#{template_name}"
  end
end
