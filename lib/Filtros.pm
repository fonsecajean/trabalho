package Filtros;
use strict;
use warnings;
use File::Copy qw(move);     
use Exporter qw(import);
     
our @EXPORT_OK = qw(addfiltro delfiltro printfiltro captalizaArquivo espacoArquivo contarCaracteres filtrarTexto);    

#nao usar chomp ao colher strings do add e sub
sub addfiltro {
	my ($nome, $palavra) = @_;
	open (my $arquivo, ">>", $nome) or die "Não foi possivel abrir o arquivo: $!";
	print $arquivo $palavra;
	close $arquivo;
}

sub delfiltro {
	my ($nome, $palavra) = @_;
	open (my $arquivo, "<" ,$nome) or die "Não foi possível abrir o arquivo: $!";
	my @linhas = <$arquivo>;
	close($arquivo);
	open ($arquivo, ">" ,$nome) or die "Não foi possível editar o arquivo: $! ";
	my $i=0;
	foreach my $linha (@linhas) {
        	print $arquivo $linha unless ($linha eq $palavra);
        	if ($linha eq $palavra) {
                	$i=1;
                                }
                        }
	if ($i==0){ print "Palavra não encontrada. \n";}
	close($arquivo);
	}

sub printfiltro {
	my ($nome) = @_;
	open (my $arquivo, "<", $nome) or die "Não foi possivel abrir o arquivo: $!";
	my @linhas = <$arquivo>;
	print @linhas;
	close($arquivo);
	}

sub captalizaArquivo {
	my ($nome) = @_;
	open (my $arquivo, "<" ,$nome) or die "Não foi possível abrir o arquivo: $!";
	my @linhas = <$arquivo>;
	close($arquivo);
	open ($arquivo, ">" ,$nome) or die "Não foi possível editar o arquivo: $! ";
	foreach my $linha (@linhas) {
        	$linha =~ s/^([a-z])/\u$1/;
        	$linha =~ s/(?<=\w\.\s)(\w)/\U$1/g;
        	print $arquivo $linha;
        	}
	close($arquivo);
	}

sub espacoArquivo {
	my ($nome) = @_;
	open (my $arquivo, "<" ,$nome) or die "Não foi possível abrir o arquivo: $!";
	my @linhas = <$arquivo>;
	close($arquivo);
	open ($arquivo, ">" ,$nome) or die "Não foi possível editar o arquivo: $! ";
	foreach my $linha (@linhas) {
       	 $linha =~ s/(\d[,.]\d)|([^\w\s](?!\s)(?!$))/$1 || "$2 "/ge;
       	 print $arquivo $linha;
        }
	close($arquivo);
	}

sub contarCaracteres {
   my ($nomeArq, $limite) = @_;
   open (my $texto, '<', $nomeArq) or die "impossível abrir arquivo";
   my $total = 0;

   while (<$texto>)
       {
       $total = ($total + length $_) -1; # -1 desconsidero o \n
       } #obter o total de caracteres
   print "tamanho >>", $total, "\n";
   if ($total > $limite)
       {
       print "Arquivo muito Grande!! \n"
       }
   else 
       {
       print "tamanho dentro do limite \n"
       }
  
  close $nomeArq;
}

sub filtrarTexto {
     my ($nomeFiltro, $nomeArq) = @_;
   
   open (my $filtro, '<', $nomeFiltro) or die "impossivel abrir arquivo";
   open (my $texto, '<', $nomeArq) or die "impossivel abrir arquivo"; 

   my @palavroes = <$filtro>;
   open (my $escrita, '>>', 'arquivo2.txt');
   
     while (<$texto>)
     {
     my $linha = $_;
        foreach my $i (0..($#palavroes-1))
	{
  	chomp ($palavroes[$i]); #tirar o \n do final >> deve ser padrão no arquivo filtro.txt 
 	$linha =~ s/($palavroes[$i])/\*\*\*\*/gi;
	}
     print $escrita $linha;
     print $linha;
     }
 
  move 'arquivo2.txt', $nomeArq; 
  
  close $filtro;
  close $texto;
     
}

1;
