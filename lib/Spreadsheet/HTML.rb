require "Spreadsheet/HTML/version"

module Spreadsheet
    class HTML

        def generate( data )

            cdata = '<table>'

            data.each do |row|
                cdata += '<tr>'
                row.each do |col|
                    cdata += '<td>' + col + '</td>'
                end
                cdata += '</tr>'
            end

            cdata += '/<table>'
            return cdata
        end

    end
end
