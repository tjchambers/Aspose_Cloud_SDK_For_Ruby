# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud
    module Pdf
      #converts pages or document into different formats
      class Converter
        def initialize(filename)
          @filename = filename
          @save_format = 'pdf'
        end
    
        # convert a particular page to image with specified size
        # @param string page_number
        # @param string image_format
        # @param number width
        # @param number height
    
        def convert_to_image_by_size(page_number, image_format, width=0, height=0)
      
          begin
        
            if @filename == ''
              raise('filename not specified')
            end
        
            if page_number == ''
              raise('page number not specified')
            end
        
            if image_format == ''
              raise('image format not specified')
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '?format=' + image_format + '&width=' + width.to_s + '&height=' + height.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})                
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''          
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + page_number.to_s + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
              return ''
            else
              return valid_output
            end
        
          rescue Exception=>e
            print e
          end
      
        end
    
=begin
    convert a particular page to image with default size
    @param number page_number
    @param string image_format
=end
    
        def convert_to_image page_number, image_format
          begin
        
            if page_number == ''
              raise('page number not specified')
            end
        
            if image_format == ''
              raise 'image format not specified'
            end
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '?format=' + image_format
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})                
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''          
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + page_number.to_s + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
              return ''
            else
              return valid_output
            end
        
          rescue Exception=>e
            print e        
          end      
        end

=begin
     convert a document to SaveFormat
=end
    
        def convert storage_name='', folder='', save_format=''
          begin
        
            if save_format.empty? == false
              @save_format = save_format
            end
        
            if @save_format == ''
              raise('save format not specified')
            end
            if(storage_name.empty? == true)        
              str_uri = $product_uri + '/pdf/' + @filename + '?format=' + @save_format
            else
              str_uri = $product_uri + '/pdf/' + @filename + '?&format=' + @save_format + '&storage='+@save_format+'&folder='+folder
            end
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})                
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
          
              if @save_format == 'html'
                save_format = 'zip'
              else
                save_format = @save_format
              end
          
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '.' + save_format
              Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
              return output_path
            else
              return valid_output
            end
        
          rescue Exception=>e
            print e        
          end      
        end

=begin
     Convert PDF to different file format without using storage
     @param string inputFile
     @param string outputFilename
     @param string outputFormat
=end
    
        def convert_local_file input_file,output_filename,output_format
          begin
        
            if input_file == ''
              raise('input file not specified')
            end                
        
            if output_filename == ''
              raise('output file not specified')
            end
        
            if output_format == ''
              raise('output format not specified')
            end
        
            if not File.exist?(input_file)
              raise("input file doesn't exist.")
            end
        
        
        
            str_uri = $product_uri + '/pdf/convert?format=' + output_format
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = Aspose::Cloud::Common::Utils.upload_file_binary(input_file, str_signed_uri)                
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
          
              if output_format == 'html'
                save_format = 'zip'
              else
                save_format = output_format
              end
          
              if output_filename == ''
                output_filename = Utils::get_filename(input_file) + '.' + save_format
              end
          
              output_path = $out_put_location + output_filename
              Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
              return ''
            else
              return valid_output
            end
        
          rescue Exception=>e
            print e        
          end      
        end    
    
      end
    end
  end
end