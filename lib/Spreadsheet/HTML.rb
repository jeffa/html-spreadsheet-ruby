require "Spreadsheet/HTML/version"

module Spreadsheet
    class HTML

        def generate( *args )
            params = _process( args )

            if !params['theta']           # north

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
            (args[0] || []).each do |key,val|
                self.instance_eval { class << self; self end }.send(:attr_accessor, key)
                self.send( "#{key}=", val )
            end
        end

        def _make_table( params )
            table = '<table>'

            params['data'].each do |row|
                table += '<tr>'
                row.each do |col|
                    table += '<' + col['tag'] + '>' + col['cdata'] + '</' + col['tag'] + '>'
                end
                table += '</tr>'
                tag = 'td'
            end

            table += '</table>'
            return table
        end

        def _process( args )
            params = _args( args )

            params['data'].shift if params['headless']

            data = []
            tag  = ( params['matrix'] or params['headless'] ) ? 'td' : 'th'

            params['data'].each do |row|
                r = []
                row.each do |col|
                    r.push( { 'tag' => tag, 'cdata' => col.to_s } )
                end
                data.push( r )
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
            (args[0] || []).each do |key,val|
                params[key] = val
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
