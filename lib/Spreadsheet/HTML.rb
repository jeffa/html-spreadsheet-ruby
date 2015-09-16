require "Spreadsheet/HTML/version"

module Spreadsheet
    class HTML

        def initialize( *args )
            if args[0]
                args[0].each do |key,val|
                    self.instance_eval { class << self; self end }.send(:attr_accessor, key)
                    self.send( "#{key}=", val )
                end
            end
        end

        def generate( *args )
            params = _process( args )

            params['data'].shift if params['headless']

            return _make_table( params )
        end

        def _make_table( params )
            cdata = '<table>'
            tag   = ( params['matrix'] or params['headless'] ) ? 'td' : 'th'

            params['data'].each do |row|
                cdata += '<tr>'
                row.each do |col|
                    cdata += "<#{tag}>#{col}</#{tag}>"
                end
                cdata += '</tr>'
                tag = 'td'
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
