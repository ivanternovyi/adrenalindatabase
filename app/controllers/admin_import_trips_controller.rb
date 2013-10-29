class AdminImportTripsController < ApplicationController
  def index
  end

  def upload
    file = params[:file]
    xlsx = Roo::Excelx.new(file.path, nil, :ignore)
    txt = '<h1>Tables</h1>'
    xlsx.sheets.each do |sheet| 
      xlsx.default_sheet = sheet
      txt += "<br />" + sheet
      txt += '<table>'
      xlsx.first_row.upto(xlsx.last_row).each do |r|
        txt += "<tr>"
        xlsx.first_column.upto(xlsx.last_column).each do |c|
          txt += "<td>" + xlsx.cell(r, c).to_s + "</td>"
        end
        txt += "</tr>"
      end
      txt += "</table>"
    end
    render text: txt
  end

  def new
  end

  def create
    file = params[:file]
    render text: file.path
  end
end