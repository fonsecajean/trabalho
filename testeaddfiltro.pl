use warnings;
use strict;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib dirname(dirname abs_path $0) . '/lib';
use lib ('/trabalho/lib');

use Filtros qw(addfiltro);

print "Entre com o nome do arquivo de filtro para adicionar: \n";
my $nome=<STDIN>;
chomp($nome);
print "Entre com a palavra que deseja adicionar ao filtro: \n";
my $palavra=<STDIN>;
addfiltro($nome, $palavra);
