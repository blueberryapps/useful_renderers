require "useful_renderers/version"
require 'useful_renderers/csv_renderable'
require 'useful_renderers/zip_renderable'
require 'action_controller/metal/renderers'

module UsefulRenderers
  class RenderUsefulRailtie < ::Rails::Railtie
    config.after_initialize do

      ActionController.add_renderer :csv do |csv, options|
        filename = options[:filename] || options[:template]
        csv.extend UsefulRenderers::CsvRenderable
        data = csv.respond_to?(:to_csv) ? csv.to_csv(options) : csv
        send_data data, type: Mime[:csv], disposition: "attachment; filename=#{filename}.csv"
      end

      ActionController.add_renderer :zip do |zip, options|
        filename = options[:filename] || options[:template]
        zip.extend UsefulRenderers::ZipRenderable
        data = zip.respond_to?(:to_zip) ? zip.to_zip(options) : zip
        send_data data, type: 'application/zip', disposition: "attachment; filename=#{filename}.zip"
      end

    end
  end
end
