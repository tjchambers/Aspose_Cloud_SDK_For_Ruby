# This class allows you to set the AppSID and AppKey values you get upon signing up
module Aspose
  module Cloud
    module Common
      class AsposeApp
        def initialize(app_sid,app_key)  
          $app_sid = app_sid
          $app_key = app_key      
          $out_put_location = ''
        end
      end
    end
  end
end