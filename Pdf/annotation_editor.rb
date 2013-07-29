module Aspose
  module Cloud

    module Pdf
      class AnnotationEditor
        def initialize filename
          @filename = filename
        end
    
=begin
   Gets number of annotations on a specified document page
   @param number page_number
=end
    
        def get_annotations_count page_number
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/annotations'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Annotations']['List'].length
        
        
          rescue Exception=>e
            print e
          end
        end
    
=begin
   Gets a specfied annotation on a specified document page	   
   @param number page_number
   @param number annotation_index
=end
    
        def get_annotation page_number, annotation_index
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
        
            if annotation_index == ''
              raise 'annotation index not specified'
            end
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/annotations/' + annotation_index.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Annotation']
        
        
          rescue Exception=>e
            print e
          end
        end

=begin
   Gets list of all the annotations on a specified document page	   
   @param number page_number  
=end
    
        def get_all_annotation page_number
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
                
            total_annotations = self.get_annotations_count(page_number)
        
            all_annotations = Array.new
        
            index = 1
            while index <= total_annotations
          
              all_annotations.push(self.get_annotation(page_number, index))
          
              index+=1
            end
        
            return all_annotations
        
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Gets total number of Bookmarks in a Pdf document   
=end
    
        def get_bookmarks_count
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/bookmarks'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)  
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Bookmarks']['List'].length
        
        
          rescue Exception=>e
            print e
          end
        end

=begin
   Gets number of child bookmarks in a specfied parent bookmark   
   @param number parent
=end
    
        def get_child_bookmarks_count parent
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if parent == ''
              raise 'parent not specified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/bookmarks/' + parent.to_s + '/bookmarks'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Bookmarks']['List'].length
        
        
          rescue Exception=>e
            print e
          end
        end

=begin
   Gets a specfied Bookmark from a PDF document
   @param number bookmark_index
=end
    
        def get_bookmark bookmark_index
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if bookmark_index == ''
              raise 'bookmark index not specified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/bookmarks/' + bookmark_index.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Bookmark']
        
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Gets a specfied Child Bookmark from a PDF document
   @param number parent_index
   @param number child_index
=end
    
        def get_child_bookmark parent_index, child_index
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if parent_index == ''
              raise 'parent index not specified'
            end
        
            if child_index == ''
              raise 'child index not specified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/bookmarks/' + parent_index.to_s + '/bookmarks/' + child_index.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Bookmark']
        
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Gets list of all the bookmarks in pdf     
=end
    
        def get_all_bookmarks
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
                
                
            total_bookmarks = self.get_bookmarks_count
        
            all_bookmarks = Array.new
        
            index = 1
            while index <= total_bookmarks
          
              all_annotations.push(self.get_bookmark(index))
          
              index+=1
            end
        
            return all_bookmarks
        
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Gets total number of Attachments in a Pdf document   
=end
    
        def get_attachments_count
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/attachments'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        

            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Attachments']['List'].length
        
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Gets a specfied Attachment from a PDF document
   @param number attachment_index
=end
    
        def get_attachment attachment_index
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if attachment_index == ''
              raise 'attachment index not specified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/attachments/' + attachment_index.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Attachment']
        
        
          rescue Exception=>e
            print e
          end
        end       

=begin
   Gets list of all the attachments in pdf     
=end
    
        def get_all_attachments
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
                
                
            total_attachments = self.get_attachments_count
        
            all_attachments = Array.new
        
            index = 1
            while index <= total_attachments
          
              all_annotations.push(self.get_attachment(index))
          
              index+=1
            end
        
            return all_attachments
        
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Download a specfied Attachment from a PDF document
   @param number attachment_index
=end
    
        def download_attachment attachment_index
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if attachment_index == ''
              raise 'attachment index not specified'
            end
                
            file_info = self.get_attachment(attachment_index)
        
        
            str_uri = $product_uri + '/pdf/' + @filename + '/attachments/' + attachment_index.to_s + '/download'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                   
              output_path = $out_put_location + file_info['Name'];
              Aspose::Cloud::Common::Utils.saveFile(response_stream,output_path)
              return ''
            else
              return valid_output
            end
        
        
          rescue Exception=>e
            print e
          end
        end     

=begin
   Gets total number of Links in a Pdf document
   @param number page_number
=end
    
        def get_links_count page_number
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/links'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Links']['List'].length
        
        
          rescue Exception=>e
            print e
          end
        end 

=begin
   Gets a specfied link on a specified document page	   
   @param number page_number
   @param number annotation_index
=end
    
        def get_link page_number, link_index
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
        
            if link_index == ''
              raise 'link index not specified'
            end
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/links/' + link_index.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Link']
        
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Gets list of all the links on a specified document page	   
   @param number page_number  
=end
    
        def get_all_links page_number
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
                
            total_links = self.get_links_count(page_number)
        
            all_links = Array.new
        
            index = 1
            while index <= total_links
          
              all_annotations.push(self.get_link(page_number, index))
          
              index+=1
            end
        
            return all_links
        
        
          rescue Exception=>e
            print e
          end
        end     

=begin
   Checks whether selected bookmark is parent or child Gets a specfied child Bookmark for selected parent bookmark in Pdf document   
   @param number bookmark_index
=end
    
        def is_child_bookmark bookmark_index
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if bookmark_index == ''
              raise 'bookmark index not specified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/bookmarks/' + bookmark_index.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Bookmark']
        
        
          rescue Exception=>e
            print e
          end
        end
    
      end
    end
    
  end
end