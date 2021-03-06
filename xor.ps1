param
([Parameter (Mandatory=$true)]
[string] $file1,
[Parameter (Mandatory=$true)]
[string] $file2,
[Parameter (Mandatory=$true)]
[string] $out
)#end param

#Read two files as byte arrays
$file1_b = [System.IO.File]::ReadAllBytes("$file1")
$file2_b = [System.IO.File]::ReadAllBytes("$file2")

#Set the length to be the smaller one
$len = if ($file1_b.Count -lt $file2_b.Count){$file1_b.Count}
        else{$xord_byte_array = New-Object Byte[] $len}

#XOR between the files
for ($i=0; $i -lt $len; $i++)
{$xord_byte_array[$i] = $file1_b[$1] -bxor $file2_b[$i]

#Write the XORd  bytes to the output file
[System.IO.File]::WriteAllBytes("$out", $xord_byte_array)

write-host"[*] $file1 XOR $file2'n[*] Saved to " -nonewline;
write-host"$out" -foregroundcolor yellow -nonewline;
write-host ".";