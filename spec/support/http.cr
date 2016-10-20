require "http/client"

module HTTPHelper
  def get(path)
    HTTP::Client.get("http://localhost:8000#{path}")
  end
end
