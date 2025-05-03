function rcpp
         set -l fname (string sub --start=1 --end=-4 $argv)
         g++ $argv -o {$fname}.exe && ./{$fname}.exe

end
