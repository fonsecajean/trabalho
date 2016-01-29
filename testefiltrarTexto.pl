use warnings;
use strict;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib ('/trabalho/lib');
use lib dirname(dirname abs_path $0) . '/lib';

use Filtros qw(filtrarTexto);

print "Digite nome do arquivo: \n";
my $nomeArq = <STDIN>;
chomp $nomeArq;

print "digite nome do filtro: \n";
my $nomeFiltro = <STDIN>;
chomp $nomeFiltro;

filtrarTexto ($nomeFiltro,  $nomeArq);
