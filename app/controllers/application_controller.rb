class ApplicationController < ActionController::API
    
    def key
        "elephant_trunk"
    end

    def encode(payload)
        return JWT.encode(payload, key(), "HS512")
    end

    def decode(token)
        return JWT.decode(token, key(), true, {algorithm: "HS512"})[0]
    end

end
