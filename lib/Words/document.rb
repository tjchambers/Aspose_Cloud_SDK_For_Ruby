# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Words
      class Document
        def initialize filename
          @filename = filename
          raise 'Base file not specified.' if filename.blank?
        end

=begin
  Appends a list of documents to this one.
  @param string append_docs
  @param import_format_modes
  @param source_folder
=end

        def append_document append_docs, import_format_modes, source_folder

          if append_docs.length != import_format_modes.length
            raise 'Please specify complete documents and import format modes.'
          end

          str_uri = $product_uri + '/words/' + @filename + '/appendDocument'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          objs = []

          i = 0
          append_docs.each do |val|
            objs << {"Href" => source_folder.empty? ? val : source_folder + "\\" + val, "ImportFormatMode" => import_format_modes[i]}
            i = i+1
          end

          json_data = JSON.generate({'DocumentEntries' => objs})

          response_stream = ::RestClient.post(signed_str_uri, json_data, {:content_type => :json})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          return valid_output unless valid_output.empty?
          folder = Aspose::Cloud::AsposeStorage::Folder.new

          output_stream = folder.get_file(source_folder.empty? ? @filename : (source_folder + '/' + @filename))
          output_path = $out_put_location + @filename
          Aspose::Cloud::Common::Utils.save_file(output_stream, output_path)
          ''

        end

=begin
   Get Resource Properties information like document source format, IsEncrypted, IsSigned and document properties   
=end

        def get_document_info
          str_uri = $product_uri + '/words/' + @filename
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          stream_hash = JSON.parse(response_stream)
          stream_hash['Code'] == 200 ? stream_hash['Document'] : false
        end

=begin
   Get Resource Properties information like document source format, IsEncrypted, IsSigned and document properties
   @param string property_name
=end

        def get_property property_name
          raise 'Property name not specified.' if preperty_name.blank?

          str_uri = $product_uri + '/words/' + @filename + '/documentProperties/' + property_name
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          stream_hash = JSON.parse(response_stream)
          stream_hash['Code'] == 200 ? stream_hash['DocumentProperty'] : false
        end

=begin
   Set document property
   @param string property_name
   @param string property_value
=end

        def set_property property_name, property_value
          raise 'Property name not specified.' if property_name.blank?
          raise 'Property value not specified.' if property_value.blank?

          post_hash = {'Value' => property_value}
          json_data = post_hash.to_json

          str_uri = $product_uri + '/words/' + @filename + '/documentProperties/' + property_name
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.put(signed_str_uri, json_data, {:content_type => :json})

          xmldoc = REXML::Document.new(response_stream)

          if xmldoc.elements.to_a('SaaSposeResponse/Status').first.text == 'OK'
            return xmldoc.elements.to_a('SaaSposeResponse/DocumentProperty')
          end

          false
        end

=begin
   Delete a document property
   @param string property_name
=end

        def delete_property property_name

          raise 'Property name not specified.' if property_name.blank?

          str_uri = $product_uri + '/words/' + @filename + '/documentProperties/' + property_name
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.delete(signed_str_uri, {:accept => 'application/json'})
          JSON.parse(response_stream)['Code'] == 200
        end

=begin
   Get Document's properties
=end

        def get_properties
          str_uri = $product_uri + '/words/' + @filename + '/documentProperties'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          stream_hash = JSON.parse(response_stream)

          return stream_hash['DocumentProperties']['List'] if  stream_hash['Code'] == 200
          false
        end

=begin
     Convert Word to different file format without using storage
     @param string inputFile
     @param string outputFilename
     @param string outputFormat
=end

        def convert_local_file input_file, output_filename, output_format

          raise('input file not specified') if input_file.blank?
          raise('output file not specified') if output_filename.blank?
          raise('output format not specified') if output_format.blank?

          str_uri = $product_uri + '/words/convert?format=' + output_format
          str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = Aspose::Cloud::Common::Utils.upload_file_binary(input_file, str_signed_uri)

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          return valid_output unless valid_output.blank?

          output_path = $out_put_location + output_filename
          Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
          ''

        end

      end
    end

  end
end