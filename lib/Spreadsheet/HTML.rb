require "Spreadsheet/HTML/version"

module Spreadsheet
    class HTML

        def generate( *args )
            data = _process( *args )
            return _make_table( data )
        end

        def _make_table( data )
            cdata = '<table>'

            data.each do |row|
                cdata += '<tr>'
                row.each do |col|
                    cdata += "<td>#{col}</td>"
                end
                cdata += '</tr>'
            end

            cdata += '/<table>'
            return cdata
        end

        def _process( *args )
            data = _args( *args )
            return data
        end

        def _args( *args )
           return args[0] 
        end

    end
end
