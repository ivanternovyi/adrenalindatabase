require 'net/http'
require 'nokogiri'

class SmsClient
  def initialize(api_key = '', sender_name = '')
    @api_key = api_key
    @sender_name = sender_name
    @api_url = 'http://alphasms.com.ua/api/xml.php'
  end

  def xml_headers(data)
    xml_data = '<?xml version="1.0" encoding="utf-8" ?>'
    xml_data += '<package key="' << @api_key << '">'
    xml_data += data
    xml_data += '</package>'
  end

  def get_balance
    resultXML = send_data_to_service(xml_headers('<balance></balance>'))
    doc = Nokogiri::XML(resultXML)
    puts doc.css('balance amount').text
    puts doc.css('balance currency').text
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
    resp = HTTParty.post @api_url, body: data, headers: {'Content-type' => 'text/xml'}
    resp.body
  end
end