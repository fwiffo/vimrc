#!/usr/bin/perl

@color_order = ( # {{{
    'Black',
    'DarkBlue',
    'DarkGreen',
    'DarkCyan',
    'DarkRed',
    'DarkMagenta',
    'Brown',
    'Gray',
    'DarkGray',
    'LightBlue',
    'LightGreen',
    'LightCyan',
    'LightRed',
    'LightMagenta',
    'Yellow',
    'White',
); # }}}

%colors = ( # {{{
    'Black'        => "000000",
    'DarkBlue'     => "0000aa",
    'DarkGreen'    => "00aa00",
    'DarkCyan'     => "00aaaa",
    'DarkRed'      => "aa0000",
    'DarkMagenta'  => "aa00aa",
    'Brown'        => "aa5500",
    'Gray'         => "aaaaaa",
    'DarkGray'     => "555555",
    'LightBlue'    => "5555ff",
    'LightGreen'   => "55ff55",
    'LightCyan'    => "55ffff",
    'LightRed'     => "ff5555",
    'LightMagenta' => "ff55ff",
    'Yellow'       => "ffff55",
    'White'        => "ffffff",
); # }}}

%bright2dim = ( # {{{
    'DarkGray'     => 'Black',
    'LightBlue'    => 'DarkBlue',
    'LightGreen'   => 'DarkGreen',
    'LightCyan'    => 'DarkCyan',
    'LightRed'     => 'DarkRed',
    'LightMagenta' => 'DarkMagenta',
    'Yellow'       => 'Brown',
    'White'        => 'Gray',
); # }}}

sub doall { # {{{
    my ($func) = @_;
    print "\t\tif (\$USER) == \"root\"\n";
    foreach $name (@rootnames) {
        print "\t";
        &$func($name, $roots{$name});
    }

    print "\t\telse\n";

    foreach $name (@rootnames) {
        print "\t";
        &$func($name, $users{$name});
    }

    print "\t\tendif\n";

    foreach $name (@names) {
        &$func($name, $users{$name});
    }
} # }}}

sub parse { # {{{
    my ($name, $data) = @_;
    my ($fgdata, $bgdata, $fg16, $bg16, $attr16, $fg8, $bg8, $bg16);

    ($fgdata, $bgdata) = split /\s*,\s*/, $data;
    ($fg16, $fg8) = split /\s*:\s*/, $fgdata;
    ($bg16, $bg8) = split /\s*:\s*/, $bgdata;
    $fg8 = $fg16 if (!$fg8);
    $bg8 = $bg16 if (!$bg8);
    $attr16 = "NONE";
    $attr16 .= ",$attrs{$name}" if ($attrs{$name});
    $attr8 = $attr16;
    $attr8 .=",bold" if ($bright2dim{$fg8});
    return ($fg16, $bg16, $attr16, $fg8, $bg8, $attr8);
} # }}}

sub printentry { # {{{
    my ($name, $ter, $fg, $bg, $attr) = @_;
    print "\t\thi $name";
    print " ${ter}fg=$fg" if ($fg and $fg ne "\#");
    print " ${ter}bg=$bg" if ($bg and $bg ne "\#");
    print " ${ter}=$attr" if ($attr);
    print "\n";
} # }}}

sub do16 { # {{{
    my ($name, $data) = @_;
    my ($fg16, $bg16, $attr16, $fg8, $bg8, $attr8) = &parse($name, $data);
    &printentry($name, 'cterm', $fg16, $bg16, $attr16);
} # }}}

sub do8 { # {{{
    my ($name, $data) = @_;
    my ($fg16, $bg16, $attr16, $fg8, $bg8, $attr8) = &parse($name, $data);
    &printentry($name, 'cterm', $fg8, $bg8, $attr8);
} # }}}

sub dogui { # {{{
    my ($name, $data) = @_;
    my ($fg16, $bg16, $attr16, $fg8, $bg8, $attr8) = &parse($name, $data);
    &printentry($name, 'gui', "\#$colors{$fg16}", "\#$colors{$bg16}", $attr16);
} # }}}

sub readfile { # {{{
    while (defined($line = <>)) {
        $line =~ s/#.*//g;
        $line =~ s/(^\s+|\s+$)//g;
        next if $line eq "";
        if ($line =~ /^(\w+)\s+(.+)$/) {
            ($name, $data) = ($1, $2);
            ($colordata, $attr) = split /\s*!\s*/, $data;
            ($userdata, $rootdata) = split /\s*\/\s*/, $colordata;
            if ($rootdata) {
                push @rootnames, $name;
                $roots{$name} = $rootdata;
            } else {
                push @names, $name;
            }
            $users{$name} = $userdata;
            $attrs{$name} = $attr;
        }
    }

} # }}}

($sec, $min, $hour, $day, $mon, $year) = localtime();
$year += 1900;
$mon = sprintf("%02d", $mon);
$day = sprintf("%02d", $day);

print <<"END_VIM"; # {{{
" vim:ts=4:sw=4:noet:
" =================================================================
" phong.vim - my fancy color file
" Original author - Thomas Schumm <phong\@phong.org>
"
" This file is generated by a script.
" Last generated: $year-$mon-$day: Thomas Schumm <phong\@phong.org>
" =================================================================
END_VIM
# }}}

&readfile();

$fs = '{{{';
$fe = '}}}';

print <<'END_VIM'; # {{{
let g:colors_name="phong"

if &term == "cygwin" || &term == "putty" || &term == "rxvt" || &term == "xterm" " {{{
    " This lets you use bright backgrounds on some terminals that
    " otherwise don't allow it.  Doesn't work with the 'reverse'
    " attribute, but could be made to do so (but is a waste of time
    " because reverse is sorta redundant if you can explicitly
    " specify a foreground and background)
    set t_Co=16
    set t_AF=[3%{7}%p1%&%d%{7}%p1%<%Pa%?%ga%t;1%;m
    set t_AB=[4%{7}%p1%&%d%{7}%p1%<%Pa%?%ga%t;5%;m
endif " }}}

if &term == "xterm"
    set t_Co=16
endif

" ----------------------------------------------------------------------
" We have a color term or gui
" ----------------------------------------------------------------------
if &t_Co >= 8 || has("gui_running")
    set background=dark
    if version >= 600
    hi clear
        syntax enable
    else
        syntax on
    endif
    set nohlsearch
END_VIM

print <<"END_VIM";
    " We have GUI $fs
    if has("gui_running")
END_VIM
# }}}

&doall(\&dogui);

print <<"END_VIM"; # {{{
    " $fe

    " Terminal, bright backgrounds are available $fs
    elseif &t_Co >= 16
END_VIM
 # }}}

&doall(\&do16);

print <<"END_VIM"; # {{{
    " $fe

    " Bright backgrounds are not available $fs
    " Backgrounds must be specified as 'bold'
    else
END_VIM
 # }}}

&doall(\&do8);
print "\tendif \" $fe\n\nendif\n";