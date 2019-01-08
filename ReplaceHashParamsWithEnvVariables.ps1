param(
    [string]$FilePath = "",
    [string]$NewFilePath = ""
)

if ([string]::IsNullOrEmpty($FilePath)) {
    return 1;
}

if ([string]::IsNullOrEmpty($NewFilePath)) {
    $NewFilePath = $FilePath;
}

$fileContent = Get-Content $FilePath;
$envVariables = Get-ChildItem Env:

$envVariables | ForEach-Object {
    $name = $_.Name;
    $value = $_.Value;
    $valueToReplace = "#{" + $name + "}";
    $fileContent = $fileContent  -replace $valueToReplace, $value
}

$fileContent | Out-File -Force -FilePath $NewFilePath