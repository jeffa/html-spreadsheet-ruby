require "Spreadsheet/HTML/version"
require "HTML/AutoTag"

# i cannot instantiate any HTML::foo inside any bar::HTML?!?
module Auto
    class Tag < HTML::AutoTag
    end
end
module Enco
    class Der < HTML::Encoder
    end
end

module Spreadsheet
    class HTML

        def self.gen( *args )
            self.new.generate( *args )
        end

        def north( *args )
            generate( *args, 'theta' => 0 )
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
            generate( *args, 'theta' => 90, 'tgroups' => 0, 'pinhead' => 1 )
        end

        def south( *args )
            generate( *args, 'theta' => -180, 'tgroups' => 0, 'pinhead' => 1 )
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
            cdata = [] # TODO: insert caption and colgroup

            if params['tgroups'] && params['tgroups'] > 0

                body = params['data']
                head = body.shift() unless params['matrix'] && data.size() > 2
                foot = body.pop() if !params['matrix'] && params['tgroups'] > 1 and data.size() > 2

                head_row  = { 'tag' => 'tr', 'attr' => params['thead.tr'], 'cdata' => head }
                foot_row  = { 'tag' => 'tr', 'attr' => params['tfoot.tr'], 'cdata' => foot }
                body_rows = body.map{ |r| { 'tag' => 'tr', 'attr' => params['tr'], 'cdata' => r } }

                cdata.push({ 'tag' => 'thead', 'attr' => params['thead'], 'cdata' => head_row }) if head
                cdata.push({ 'tag' => 'tfoot', 'attr' => params['tfoot'], 'cdata' => foot_row }) if foot
                cdata.push({ 'tag' => 'tbody', 'attr' => params['tbody'], 'cdata' => body_rows })

            else
                cdata.push( params['data'].map { |c| { 'tag' => 'tr', 'attr' => params['tr'], 'cdata' => c } } )
            end

            return params['auto'].tag( 'tag' => 'table', 'attr' => params['table'], 'cdata' => cdata )
        end

        def _process( args )
            params = _args( args )

            # headings is an alias for -r0
            params['-r0'] = params['headings']

            index = {}
            if params['data'][0].size()
            end

            data  = params['data']
            empty = params['empty'] || '&nbsp;'
            tag   = ( params['matrix'] or params['headless'] ) ? 'td' : 'th'

            encoder = Enco::Der.new
            for i in 0 .. params['_max_rows'] - 1

                data[i] ||= []
                unless params['_layout']
                    (params['_max_cols'] - data[i].size).times { data[i].push( nil ) }  # pad
                    (data[i].size - params['_max_cols']).times { data[i].pop }          # truncate
                end

                r = []
                data[i].each do |col|

                    col = col.to_s
                    col = encoder.encode( col, params['encodes'] ) if params['encode'] or !params['encodes'].to_s.empty?
                    col = col.gsub( /^\s*$/, empty.to_s )
                    r.push( { 'tag' => tag, 'attr' => params[tag], 'cdata' => col } )

                end

                data[i] = r
                tag = 'td'
            end

            params['data'] = data
            params['data'].shift if params['headless']

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
                'indent'    => params['indent'],
                'level'     => params['level'],
                'sorted'    => params['attr_sort'],
            )

            if !params['data'] and data[0].kind_of?(Array)
                data = [ data ] if !data[0][0].kind_of?(Array)
                params['data'] = data[0]
            end

            params['data'] = [ [ nil ] ] if params['data'].nil?

            params['_max_rows'] = params['data'].size    || 1
            params['_max_cols'] = params['data'][0].size || 1
            params['data']      = params['data'].clone

            if params['fill']
                (row,col) = params['fill'].split(/\D/)    
                if row.to_i > 0 && col.to_i > 0
                    params['_max_rows'] = row.to_i if row.to_i > params['_max_rows']
                    params['_max_cols'] = col.to_i if col.to_i > params['_max_cols']
                end
            end

            return params
        end

    end

end
