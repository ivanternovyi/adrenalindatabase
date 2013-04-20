require 'net/http'
require 'nokogiri'

class SmsClient
  def initialize(api_key = '', sender_name = '')
    @api_key = api_key
    @sender_name = sender_name
    @api_url = 'http://alphasms.com.ua/api/xml.php'
    @env = Rails.application.config.sms_service_env
  end

  def xml_headers(data)
    xml_data = '<?xml version="1.0" encoding="utf-8" ?>'
    xml_data += '<package key="' << @api_key << '">'
    xml_data += data
    xml_data += '</package>'
  end

  def get_balance
      resultXML = send_data_to_service(xml_headers('<balance></balance>'))
    if @env == :production
      doc = Nokogiri::XML(resultXML)
    else
      resultXML
    end
    # puts doc.css('balance amount').text
    # puts doc.css('balance currency').text
  end

  def send_sms(numbers, message = '')
    if !numbers.nil? && !numbers.empty?
      data = '<message>'
      numbers.each do |number|
        data += '<msg recipient="' << number <<'" sender="' << @sender_name << '" type="0">' << message << '</msg>'
      end
      data += '</message>'
      send_data_to_service xml_headers(data)
    end
  end


  private
  def send_data_to_service(data)
    if @env == :production
      resp = HTTParty.post @api_url, body: data, headers: {'Content-type' => 'text/xml'}
      resp.body
    else
      data
    end
  end
end