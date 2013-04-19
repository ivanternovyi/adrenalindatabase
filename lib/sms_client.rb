require 'net/http'

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
    send_data_to_service(xml_headers('<balance></balance>'))
  end

  def send_sms(numbers, message = '')
    if !numbers.nil? && !numbers.empty?
      data = '<messages>'
      numbers.each do |number|
        data += '<msg recipient="' << number <<'" sender="' << @sender_name << '" type="0">' << message << '</msg>'
      end
      data += '</messages>'
      send_data_to_service xml_headers(data)
    end
  end


  private
  def send_data_to_service(data)
    p data
    # uri = URI.parse(@api_url)
    # uri = URI.parse(@api_url)
    # https = Net::HTTP.new(uri.host, uri.port)
    # https.use_ssl = true
    # https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    # https.ca_path = '/etc/ssl/certs' if File.exists?('/etc/ssl/certs') # Ubuntu
    # https.ca_file = '/opt/local/share/curl/curl-ca-bundle.crt' if File.exists?('/opt/local/share/curl/curl-ca-bundle.crt') # Mac OS X
    # resp, data = https.post(uri.host, data, "Content-Type: text/xml; charset=utf-8 Content-Length: #{data.length}")

    resp = HTTParty.post @api_url, body: data, headers: {'Content-type' => 'text/xml'}

    puts resp.body

  end
end