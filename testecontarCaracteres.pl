use warnings;
use strict;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib ('/trabalho/lib');
use lib dirname(dirname abs_path $0) . '/lib';

use Filtros qw(contarCaracteres);

print "Entre com o nome do arquivo: \n";
my $arquivo=<STDIN>;
chomp($arquivo);
print "Digite o tamanho do arquivo:\n ";
my $lim = <STDIN>;
contarCaracteres($arquivo,$lim);
