require "Spreadsheet/HTML/version"

module Spreadsheet
    class HTML

        def initialize( *args )
            @data = Array[[1,'a'], [2,'b']]
            args.each do |key,val|
                @data = val if key == 'data'
            end
        end

        def generate( *args )
            params = _process( args )
            return _make_table( params )
        end

        def _make_table( params )
            data  = params['data']
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

        def _process( args )
            params = _args( args )
            params['data'] = @data if !params['data']
            return params
        end

        def _args( things )

            data   = []
            args   = []
            params = {}

            while !things.empty?

                if things[0].kind_of?(Array)
                    data.push( things.shift() )
                    if things[0].kind_of?(Array)
                        data.push( things.shift() )
                    else
                        args.push( things.shift(), things.shift() )
                    end
                else
                    args.push( things.shift(), things.shift() )
                end

            end

#$data ||= (@data == 1) ? $data[0] : (@data) ? [ @data ] : undef;

            params['data'] = data[0]
            args.each do |key,val|
                params[key] = val
            end

            return params
        end

    end
end
