require 'rubygems'
require 'zip'

module UsefulRenderers
  module ZipRenderable

    # You need to call this on collection of File objects
    # or objects which provides :read & :path method

    def to_zip(*)
      return '' if empty?
      return '' unless first.respond_to?(:path) && first.respond_to?(:read)

      stringio = Zip::OutputStream.write_buffer do |zio|
        self.each do |obj|
          filename = File.basename(obj.path)
          zio.put_next_entry(filename)
          zio.write obj.read
        end
      end
      stringio.rewind
      stringio.sysread
    end
  end
end
