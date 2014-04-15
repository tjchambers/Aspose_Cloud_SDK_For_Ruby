# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Words
      class MailMerge
        def initialize filename
          @filename = filename
          raise 'Base file not specified.' if filename.empty?
        end

=begin
   Executes mail merge without regions.
   @param string filename
   @param string str_xml
=end

        def execute_mail_merge str_xml

          if str_xml == ''
            raise 'XML not specified.'
          end

          str_uri = $product_uri + '/words/' + @filename + '/executeMailMerge'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.post(signed_str_uri, str_xml, {:accept => :json})
          stream_hash = JSON.parse(response_stream)

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.blank?
            folder = Aspose::Cloud::AsposeStorage::Folder.new
            output_stream = folder.get_file(stream_hash['Document']['FileName'])
            output_path = $out_put_location + @filename
            Aspose::Cloud::Common::Utils.save_file(output_stream, output_path)
            return ''
          end

          valid_output


        end

=begin
   Executes mail merge with regions.
   @param string filename
   @param string str_xml
=end

        def execute_mail_merge_with_regions str_xml
          raise 'XML not specified.' if str_xml.blank?

          str_uri = $product_uri + '/words/' + @filename + '/executeMailMerge?withRegions=true'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = ::RestClient.post(signed_str_uri, str_xml, {:accept => :json})
          stream_hash = JSON.parse(response_stream)
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.blank?
            folder = Aspose::Cloud::AsposeStorage::Folder.new
            output_stream = folder.get_file(stream_hash['Document']['FileName'])
            output_path = $out_put_location + @filename
            Aspose::Cloud::Common::Utils.save_file(output_stream, output_path)
            return ''
          end
          valid_output

        end

=begin
   Executes mail merge with regions.
   @param string filename
   @param string str_xml
=end

        def execute_template str_xml
          raise 'XML not specified.' if str_xml.blank?

          str_uri = $product_uri + '/words/' + @filename + '/executeTemplate'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = ::RestClient.post(signed_str_uri, str_xml, {:accept => :json})
          stream_hash = JSON.parse(response_stream)
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.blank?
            folder = Aspose::Cloud::AsposeStorage::Folder.new
            output_stream = folder.get_file(stream_hash['Document']['FileName'])
            output_path = $out_put_location + @filename
            Aspose::Cloud::Common::Utils.save_file(output_stream, output_path)
            return ''
          end

          valid_output
        end

      end
    end

  end
end