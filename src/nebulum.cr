require "json"
require "http/client"

class Nebulum
  API_PATH = "api/v1"
  def initialize
    @headers = HTTP::Headers{
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://rovers.nebulum.one")
    @http_client = HTTP::Client.new(uri)
  end

  def get_photo_by_id(photo_id : Int32) : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/photos/#{photo_id}", headers: @headers).body)
  end

  def get_photo_by_earth_date(earth_date : String) : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/photos?earth_date=#{earth_date}", headers: @headers).body)
  end

  def get_photo_by_sol(sol_number : Int32) : JSON::Any
    JSON.parse(
      @http_client.get("/#{API_PATH}/photos?sol=#{sol_number}", headers: @headers).body)
  end
end
