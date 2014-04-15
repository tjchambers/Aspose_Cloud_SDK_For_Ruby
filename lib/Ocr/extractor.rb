module Aspose
  module Cloud

    module OCR
      class Extractor
        def initialize
      
        end
    
        def extract_text(*args)
          case args.size
          when 2
            image_file_name,folder = *args
            begin
              str_uri = ''
              if(folder=='' || folder==nil)
                str_uri += $product_uri + '/ocr/' + image_file_name.to_s + '/recognize'
              else
                str_uri += $product_uri + '/ocr/' + image_file_name.to_s + '/recognize?folder=' + folder.to_s
              end
          
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

              response = ::RestClient.get(signed_uri, :accept=> 'application/json')
              json = JSON.parse(response)
              return json         
            rescue Exception=>e
              print e
              return nil
            end
          when 4
            image_file_name,folder,language,use_default_dictionaries = *args
            begin
              str_uri = ''
              if(folder=='' || folder==nil)
                str_uri += $product_uri + '/ocr/' + image_file_name.to_s + '/recognize?language=' + language.to_s + '&useDefaultDictionaries=' + use_default_dictionaries.to_s
              else
                str_uri += $product_uri + '/ocr/' + image_file_name.to_s + '/recognize?language=' + language.to_s + '&useDefaultDictionaries=' + use_default_dictionaries.to_s + '&folder=' + folder.to_s
              end
          
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
              response = ::RestClient.get(signed_uri, :accept=> 'application/json')
              json = JSON.parse(response)
              return json         
            rescue Exception=>e
              print e
              return nil
            end
          when 1
            image_file_name = args[0]
            begin
              str_uri = $product_uri + '/ocr/'	+ image_file_name + '/recognize?useDefaultDictionaries=true'
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
              response = ::RestClient.get(signed_uri, :accept=> 'application/json')
              json = JSON.parse(response)
              return json         
            rescue Exception=>e
              print e
              return nil
            end
          when 8
            image_file_name, language , use_default_dictionaries, x , y, height, width, folder = *args
            begin
              str_uri = $product_uri
              str_uri	+= '/ocr/'
              str_uri	+= image_file_name
              str_uri	+= '/recognize?language='
              str_uri	+= language
              str_uri	+= ((x >= 0 && y >= 0 && width > 0 && height > 0) ? '&rectX=' + x.to_s	+ '&rectY=' + y.to_s + '&rectWidth=' + width.to_s + '&rectHeight=' + height.to_s : '') 
              str_uri	+= '&useDefaultDictionaries='
              str_uri	+= ((use_default_dictionaries) ? 'true' : 'false')
              str_uri	+=((folder=='') ? '' : '&folder=' + folder)

              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

              response = ::RestClient.get(signed_uri, :accept=> 'application/json')
              json = JSON.parse(response)
              return json         
            rescue Exception=>e
              print e
              return nil
            end
          when 3
            stream,language,use_default_dictionaries = *args
            begin
              str_uri = $product_uri + '/ocr/recognize?language=' + language.to_s + '&useDefaultDictionaries=' + use_default_dictionaries.to_s
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
              response = ::RestClient.post(signed_uri,stream, :accept=> 'application/json')
              json = JSON.parse(response)
              return json         
            rescue Exception=>e
              print e
              return nil
            end
          end
        end


        def extract_text_from_local_file(local_file,language,use_default_dictionaries)
          begin
            str_uri = $product_uri + '/ocr/recognize?language=' + language.to_s + '&useDefaultDictionaries=' + use_default_dictionaries.to_s
            file_stream = File.binread(local_file)
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = ::RestClient.post(signed_uri,file_stream, :accept=> 'application/json')
            json = JSON.parse(response)
            return json         
          rescue Exception=>e
            print e
            return nil
          end
        end
        def extract_text_from_url(url,language,use_default_dictionaries)
          begin
            str_uri = $product_uri + '/ocr/recognize?url=' + url + '&language=' + language + '&useDefaultDictionaries=' + use_default_dictionaries
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = ::RestClient.post(signed_uri,:accept => 'application/json')
            json=JSON.parse(response)
            return json
          rescue Exception=>e
            print e
          end
        end
      end
    end
    
  end
end