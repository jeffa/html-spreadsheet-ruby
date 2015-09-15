require "Spreadsheet/HTML/version"

module Spreadsheet
    class HTML

        def initialize( *args )
            @data = Array[[1,'a'], [2,'b']]
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
                        args.push( things.shift() ) if !things.empty?
                        args.push( things.shift() ) if !things.empty?
                    end
                else
                    args.push( things.shift() ) if !things.empty?
                    args.push( things.shift() ) if !things.empty?
                end

            end

            if args[0]
                args[0].each do |key,val|
                    params[key] = val
                end
            end

            if !params['data'] and data[0].kind_of?(Array)
                data = [ data ] if !data[0][0].kind_of?(Array)
                params['data'] = data[0]
            elsif !@data.empty?
                params['data'] = @data
            end

            return params
        end

    end
end
