
module Aspose
  module Cloud

    module Words
      class Converter
        def initialize filename=''
          @filename = filename
        end

        def convert save_format, storage_name='', folder=''
          raise 'Filename cannot be empty.' if @filename.blank?

          str_uri = $product_uri + '/words/' + @filename + '?format=' + save_format
          unless storage_name.blank?
            str_uri += "&storage=#{ storage_name }&folder=#{ folder }"
          end
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.blank?
            output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '.' + save_format
            Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
            return ''
          end

          valid_output
        end

        def convert_local_file input_path, output_path, output_format
          raise 'Input File Name not specified' if input_path.blank?
          raise 'Please Specify Output Path' if output_path.blank?
          raise 'Please Specify Output Format' if output_format.blank?

          str_uri =$product_uri + '/words/convert?format=' + output_format
          signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = Aspose::Cloud::Common::Utils.upload_file_binary(input_path, signed_uri)
          v_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          if v_output.blank?
            if output_format == 'html'
              save_format = 'zip'
            else
              save_format = output_format
            end
            output_file = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(input_path) + '.' + save_format
            Aspose::Cloud::Common::Utils.save_file(response_stream, output_file)
            return output_file
          end

          v_output

        end
      end
    end

  end
end