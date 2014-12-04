require 'csv'

module UsefulRenderers
  module CsvRenderable

    # Converts an array to CSV formatted string
    # Options include:
    # :only => [:col1, :col2] # Specify which columns to include
    # :except => [:col1, :col2] # Specify which columns to exclude
    # :add_methods => [:method1, :method2] # Include addtional methods that aren't columns

    def to_csv(options = {})
      klass = first.class
      return '' if empty?
      return join(',') unless klass.respond_to? :column_names

      columns = klass.column_names
      columns &= options[:only].map(&:to_s)        if options[:only]
      columns -= options[:except].map(&:to_s)      if options[:except]
      columns += options[:add_methods].map(&:to_s) if options[:add_methods]

      headers = columns.dup
      headers.map!{|col| klass.human_attribute_name col } if options[:translate]

      csv_options = {
        encoding: 'utf-8',
        headers: headers,
        write_headers: true
      }

      CSV.generate(csv_options) do |row|
        self.each do |obj|
          row << columns.map { |c| obj.send(c) }
        end
      end
    end
  end
end
