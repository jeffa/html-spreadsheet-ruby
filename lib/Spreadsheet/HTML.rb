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

        def self.gen  ( *args ) self.new.generate( *args ) end

        def portrait  ( *args ) generate( *args, 'theta' => 0 ) end
        def landscape ( *args ) generate( *args, 'theta' => -270, 'tgroups' => 0 ) end

        def north     ( *args ) generate( *args, 'theta' => 0 ) end
        def west      ( *args ) generate( *args, 'theta' => -270, 'tgroups' => 0 ) end
        def east      ( *args ) generate( *args, 'theta' =>   90, 'tgroups' => 0, 'pinhead' => 1 ) end
        def south     ( *args ) generate( *args, 'theta' => -180, 'tgroups' => 0, 'pinhead' => 1 ) end

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
            cdata = Array[]

            if params.has_key?( 'caption' )
                cdata.push( _tag( 'caption', params['caption'] ) )
            end

            if params.has_key?( 'colgroup' ) or params.has_key?( 'col' )
                cdata.concat( _colgroup( params ) )
            end

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
                cdata.concat( params['data'].map { |c| { 'tag' => 'tr', 'attr' => params['tr'], 'cdata' => c } } )
            end

            return params['auto'].tag( 'tag' => 'table', 'attr' => params['table'], 'cdata' => cdata )
        end

        def _process( args )
            params = _args( args )

            # headings is an alias for _r0
            params['_r0'] = params['headings']

            index = {}
            if params['data'][0].size()
                for i in 0 .. params['data'][0].size() - 1
                    key = params['data'][0][i] || ''
                    index["_#{key}"] = i
                end

                params.keys.grep( /^_/ ) do |key|
                    k = index[key] 
                    params["_c#{k}"] = params[key] if index.has_key?( key )
                end
            end

            empty = params['empty'] || '&nbsp;'
            tag   = ( params['matrix'] or params['headless'] ) ? 'td' : 'th'

            encoder = Enco::Der.new
            for r in 0 .. params['_max_rows'] - 1

                unless params['_layout']
                    params['data'][r] ||= []
                    (params['_max_cols'] - params['data'][r].size).times { params['data'][r].push( nil ) }  # pad
                    (params['data'][r].size - params['_max_cols']).times { params['data'][r].pop }          # truncate
                end

                row = []
                for c in 0 .. params['_max_cols'] - 1

                    attr  = params[tag] || {}
                    cdata = params['data'][r][c].to_s

                    [ tag, "_c#{c}", "_r#{r}", "_r#{r}c#{c}" ].each do |dyna_param|
                        if params.has_key?( dyna_param )
                            ( cdata, attr ) = _extrapolate( cdata, attr, params[dyna_param] );
                        end
                    end 

                    cdata = encoder.encode( cdata, params['encodes'] ) if params['encode'] or !params['encodes'].to_s.empty?
                    cdata = cdata.gsub( /^\s*$/, empty.to_s )
                    row.push( { 'tag' => tag, 'attr' => attr, 'cdata' => cdata } )

                end

                params['data'][r] = row
                tag = 'td'
            end

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

        def _extrapolate( cdata, orig_attr, thingy )
            new_attr = {}
            thingy = [ thingy ] unless thingy.kind_of?(Array)
            thingy.each do |t|
                if t.kind_of?(Hash)
                    new_attr = t
                elsif t.kind_of?(Proc)
                    cdata = t.call( cdata )
                end
            end

            attr = {}
            orig_attr.each { |key,val| attr[key] = val } if orig_attr.kind_of?(Hash)
            new_attr.each  { |key,val| attr[key] = val }

            return [ cdata, attr ]
        end

        def _colgroup( params )
            colgroup = Array[]
            params['col'] = Array[ params['col'] ] if params['col'].kind_of?(Hash)

            if params['col'].kind_of?(Array)
                if params['colgroup'].kind_of?(Array)
                    colgroup = params['colgroup'].map{ |cg| 
                        {
                            'tag'   => 'colgroup',
                            'attr'  => cg,
                            'cdata' => params['col'].map{ |attr| { 'tag' => 'col', 'attr' => attr } }
                        }
                    }
                else
                    colgroup = params['col'].map{ |cg| 
                        {
                            'tag'   => 'colgroup',
                            'attr'  => params['colgroup'],
                            'cdata' => params['col'].map{ |attr| { 'tag' => 'col', 'attr' => attr } }
                        }
                    }
                end
            else
                params['colgroup'] = Array[ params['colgroup'] ] if params['colgroup'].kind_of?(Hash)
                if params['colgroup'].kind_of?(Array)
                    colgroup = params['colgroup'].map{ |attr| { 'tag' => 'colgroup', 'attr' => attr } }
                end
            end

            return colgroup
        end

#sub _colgroup {
#    my %args = @_;
#
#    my @colgroup;
#    $args{col} = [ $args{col} ] if ref($args{col}) eq 'HASH';
#
#    if (ref($args{col}) eq 'ARRAY') {
#
#        if (ref $args{colgroup} eq 'ARRAY') {
#            @colgroup = map {
#                tag   => 'colgroup',
#                attr  => $_,
#                cdata => [ map { tag => 'col', attr => $_ }, @{ $args{col} } ]
#            }, @{ $args{colgroup} }; 
#        } else {
#            @colgroup = {
#                tag   => 'colgroup',
#                attr  => $args{colgroup},
#                cdata => [ map { tag => 'col', attr => $_ }, @{ $args{col} } ]
#            }; 
#        }
#
#    } else {
#
#        $args{colgroup} = [ $args{colgroup} ] if ref($args{colgroup}) eq 'HASH';
#        if (ref $args{colgroup} eq 'ARRAY') {
#            @colgroup = map { tag => 'colgroup', attr => $_ }, @{ $args{colgroup} };
#        }
#    }
#
#    return @colgroup;
#}

        def _tag( tag, cdata )
            tag = { 'tag' => tag, 'cdata' => cdata }
            if cdata.kind_of?( Hash )
                tag['cdata'] = cdata.keys[0]
                tag['attr']  = cdata.values[0]
            end
            return tag
        end

    end

end
