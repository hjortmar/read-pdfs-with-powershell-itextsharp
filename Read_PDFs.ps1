# Load itextsharp to be able to read PDFs.
Add-Type -Path "$Filepath_Root\iTextSharp\itextsharp.dll"
$Filepath_Root = $PSScriptRoot

# Convert settings to variables.
$Settings = ([System.IO.File]::ReadAllLines( "$((Get-Item $Filepath_Root).FullName)\Settings.txt" ))

$Matches = $null
If ($Settings[0] -match "(?:^|\n)pdf_folder = `"(.*?)`"") {
    $pdf_folder = $Matches[1]
}
        
$Matches = $null
If ($Settings[1] -match "(?:^|\n)output_folder = `"(.*?)`"") {
    $output_folder = $Matches[1]
}

# If folders/filepaths does not exists, create it.
If (-not (Test-Path $output_folder)) {

    Write-Host "`r`nUnable to find the filepath ""$output_folder"" in settings.txt, creating the folder."
    New-Item -Path $output_folder -ItemType Directory -ErrorAction SilentlyContinue | Out-Null

}

# Find PDFs in the filepath "pdf_folder" defined in settings.txt
$Appendixes = $null
$Appendixes = Get-Childitem –Path $pdf_folder -Filter "*.pdf*" -File

If ($null -eq $Appendixes) {
    $ErrorMsg = $null
    $ErrorMsg = "- There is no PDF in pdf_folder. (Check settings.txt)" 
}

# For each PDF found, extract the text and save it as the same filename as the pdf.. but with file ext. txt.
$Appendixes | ForEach-Object {

    $StringArray = $null
    $StringArray = @()
    $File = $null
    $File = $_.FullName
    $Filename = $null
    $Filename = $_.Name
    $Basename = $null
    $Basename = $_.BaseName
    $DirectoryName = $null
    $DirectoryName = $_.DirectoryName

    $Reader = [iTextSharp.text.pdf.PdfReader]::new($File)

    For ($Page = 1; $Page -le $Reader.NumberOfPages; $Page++) {
        ([iTextSharp.text.pdf.parser.PdfTextExtractor]::GetTextFromPage($Reader,$Page) -Replace "`n",";") | ForEach-Object {
        
            $StringArray = $StringArray += $_

        }
    }

    $Reader.Close()

    If ($StringArray -ne $null) {
            
        $Filepath_Output = "$output_folder\$Basename.txt"
        Write-Host "`r`n$Filename found."
        $StringArray | Add-Content -Path $Filepath_Output

        If (Test-Path $Filepath_Output) {
            Write-Host "`r`nThe file has been converted to txt. `r`nYou can find it here: $output_folder\$Basename.txt`r`n"
        }

    }

}