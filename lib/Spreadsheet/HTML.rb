require "Spreadsheet/HTML/version"
require "HTML/AutoTag"

# i cannot hasa instantiate HTML::AutoTag inside Spreadsheet::HTML?!?
module Auto
    class Tag < HTML::AutoTag
    end
end

module Spreadsheet
    class HTML

        def self.gen( *args )
            self.new.generate( *args )
        end

        def
            north( *args ) generate( *args, 'theta' => 0 )
        end

        def portrait( *args )
            generate( *args, 'theta' => 0 )
        end

        def west( *args )
            generate( *args, 'theta' => -270, 'tgroups' => 0 )
        end

        def landscape( *args )
            generate( *args, 'theta' => -270, 'tgroups' => 0 )
        end

        def east( *args )
            generate( *args, 'theta' => 90, 'tgroups' => 0 )
        end

        def south( *args )
            generate( *args, 'theta' => -180, 'tgroups' => 0 )
        end

        def generate( *args )
            params = _process( args )

            if params['theta'] and params['flip'] 
                params['theta'] *= -1 
            end

            if !params['theta']           # north
                if params['flip']
                    params['data'] = params['data'].map {|a| a.reverse }
                end

            elsif params['theta'] == 90   # east
                if params['pinhead'] and !params['headless']
                    params['data'] = params['data'].transpose.map{|a| a.push( a.shift ) }
                else
                    params['data'] = params['data'].transpose.map{|a| a.reverse }
                end

            elsif params['theta'] == -90
                if params['pinhead'] and !params['headless']
                    params['data'] = params['data'].transpose.reverse.map {|a| a.push( a.shift ) } 
                else
                    params['data'] = params['data'].transpose.reverse.map {|a| a.reverse }
                end

            elsif params['theta'] == 180
                if params['pinhead'] and !params['headless']
                    params['data'] = params['data'].push( params['data'].shift ).map {|a| a.reverse }
                else
                    params['data'] = params['data'].reverse.map {|a| a.reverse }
                end

            elsif params['theta'] == -180 # south
                if params['pinhead'] and !params['headless']
                    params['data'] = params['data'].push( params['data'].shift )
                else
                    params['data'] = params['data'].reverse
                end

            elsif params['theta'] == 270
                params['data'] = params['data'].transpose.reverse

            elsif params['theta'] == -270 # west
                params['data'] = params['data'].transpose

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
            cdata = [] # insert caption and colgroup
            cdata.push( params['data'].map { |c| { 'tag' => 'tr', 'attr' => {}, 'cdata' => c } } )
            return params['auto'].tag( 'tag' => 'table', 'attr' => {}, 'cdata' => cdata )
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
            self.instance_variables.each do |attr|
                params[attr[1..-1]] = self.instance_variable_get attr
            end

            (args || []).each do |hash|
                hash.each do |key,val|
                    params[key] = val
                end
            end

            params['auto'] = Auto::Tag.new(
                'encodes'   => params['encodes'],
                'indent'    => params['indent'],
                'level'     => params['level'],
                'sorted'    => params['attr_sort'],
            )

            if !params['data'] and data[0].kind_of?(Array)
                data = [ data ] if !data[0][0].kind_of?(Array)
                params['data'] = data[0]
            end

            params['data'] = params['data'].clone

            return params
        end

    end

end
