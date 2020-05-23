Set-Variable diary_path ""
Set-Location $diary_path
set-Variable weekofyear "第$([int](get-date -UFormat "%V"))周"
Set-Variable dir_list ((Get-ChildItem .).Name)
if ($weekofyear -notin $dir_list) {
    mkdir "./$weekofyear"
}
Set-Location "./$weekofyear"
if (".git" -notin (Get-ChildItem "." -Hidden).Name){
    git init .
    ".git" > "/.gitignore"
}
Set-Variable week_contents ((Get-ChildItem ".").Name)
Set-Variable this_year (Get-Date -Format "yyyy年")
Set-Variable daynames ((Get-Culture).DateTimeFormat.AbbreviatedDayNames)
foreach ($day in $daynames) {
    if ("$day" -notin $week_contents) {
        "# $this_year$weekofyear$day" > "./$day.md"
    }
}
git add *
Start-Process code "."
Set-Variable dayofweek1 (Get-Date -UFormat "%u")
Start-Process code "./$((Get-Culture).DateTimeFormat.AbbreviatedDayNames[$dayofweek1]).md"
