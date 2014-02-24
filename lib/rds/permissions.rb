require "rds/permissions/version"
require "rds/authorization"
require "rds/role_permission"
require "rds/user_permission"

module Rds
  module Permissions

    def self.included(base)
      base.around_filter :permission_exceptions
    end

    private

    def permission_exceptions
      begin 
        yield
      rescue NotPermit => e
        logger.error e
        head :forbidden
      end
    end    

    # Check if user has following permissions
    # and then raise an error
    def require_permissions!(permissions)
      unless require_permissions_method(permissions)
        raise NotPermit, "User doesn't have following permissions: #{permissions}"
      end
    end

    # Check if user has following permissions
    # and return true, false
    def require_permissions?(permissions)
      require_permissions_method(permissions)
    end

    def require_permissions_method(permissions)
      check_permissions_by_api(permissions)
    end

    # Check permission over API
    def check_permissions_by_api(permissions)
      response = HTTParty.get(Rds::Permissions::Config.api_endpoint, 
        body: { authentication_token: params[:authentication_token], 
          permissions: [permissions].flatten } )

      response.parsed_response["authorized"] || false
    end

    class Config
      # For setting up api_endpoint
      cattr_accessor :api_endpoint
    end

    # NotPermit Error exception.
    class NotPermit < Exception
    end

  end
end
