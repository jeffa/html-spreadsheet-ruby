require "Spreadsheet/HTML/version"

module Spreadsheet
    class HTML

        def generate( *args )
            params = _process( args )

            if !params['theta']             # north

            elsif params['theta'] == -90

            elsif params['theta'] == 90   # east

            elsif params['theta'] == -180 # south

            elsif params['theta'] == 180

            elsif params['theta'] == -270 # west
                params['data'] = params['data'].transpose
            elsif params['theta'] == 270

            end

            return _make_table( params )
        end

        def initialize( *args )
            if args[0]
                args[0].each do |key,val|
                    self.instance_eval { class << self; self end }.send(:attr_accessor, key)
                    self.send( "#{key}=", val )
                end
            end
        end

        def _make_table( params )
            cdata = '<table>'

            params['data'].each do |row|
                cdata += '<tr>'
                row.each do |col|
                    cdata += '<' + col['tag'] + '>' + col['cdata'] + '</' + col['tag'] + '>'
                end
                cdata += '</tr>'
                tag = 'td'
            end

            cdata += '</table>'
            return cdata
        end

        def _process( args )
            params = _args( args )
            tag    = ( params['matrix'] or params['headless'] ) ? 'td' : 'th'

            params['data'].shift if params['headless']

            data = []
            params['data'].each_with_index do |r,rindex|
                row = []
                r.each_with_index do |c,cindex|
                    row.push( { 'tag' => tag, 'cdata' => c.to_s } )
                end
                data.push( row )
                tag = 'td'
            end
            params['data'] = data

            return params
        end

        def _args( things )

            data   = []
            args   = []
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

            params = {}
            if args[0]
                args[0].each do |key,val|
                    params[key] = val
                end
            end

            self.instance_variables.each do |attr|
                params[attr[1..-1]] = self.instance_variable_get attr
            end

            if !params['data'] and data[0].kind_of?(Array)
                data = [ data ] if !data[0][0].kind_of?(Array)
                params['data'] = data[0]
            end

            params['data'] = params['data'].clone

            return params
        end

    end
end
