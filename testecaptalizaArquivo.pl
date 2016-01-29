use warnings;
use strict;

use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use lib ('/trabalho/lib');
use lib dirname(dirname abs_path $0) . '/lib';

use Filtros qw(captalizaArquivo);

print "Entre com o nome do arquivo: \n";
my $arquivo=<STDIN>;
chomp($arquivo);
captalizaArquivo($arquivo);
