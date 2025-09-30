# Create a new NUAA program directory and initialize spec.md file
# Usage: create-new-program.ps1 -Json "program description"

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$ProgramDescription,
    
    [switch]$Json
)

try {
    # Find the repository root
    $RepoRoot = git rev-parse --show-toplevel 2>$null
    if (-not $RepoRoot) {
        $RepoRoot = $PWD.Path
    }
    
    $ProgramsDir = Join-Path $RepoRoot "programs"
    
    # Create programs directory if it doesn't exist
    if (-not (Test-Path $ProgramsDir)) {
        New-Item -ItemType Directory -Path $ProgramsDir -Force | Out-Null
    }
    
    # Find the next available program number
    $NextNum = 1
    if (Test-Path $ProgramsDir) {
        $ExistingDirs = Get-ChildItem -Path $ProgramsDir -Directory | Where-Object { 
            $_.Name -match '^(\d{3})-.*' 
        }
        
        foreach ($dir in $ExistingDirs) {
            if ($dir.Name -match '^(\d{3})-.*') {
                $num = [int]$matches[1]
                if ($num -ge $NextNum) {
                    $NextNum = $num + 1
                }
            }
        }
    }
    
    # Format the program number (zero-padded to 3 digits)
    $ProgramNum = $NextNum.ToString("000")
    
    # Generate program name from description
    # Take first 3-5 words, convert to kebab-case
    $ProgramName = ($ProgramDescription -replace '[^a-zA-Z0-9 ]', '' -split '\s+')[0..4] -join '-'
    $ProgramName = $ProgramName.ToLower() -replace '-$', ''
    
    # Create full program ID
    $ProgramId = "$ProgramNum-$ProgramName"
    $ProgramDir = Join-Path $ProgramsDir $ProgramId
    
    # Create program directory
    New-Item -ItemType Directory -Path $ProgramDir -Force | Out-Null
    
    # Create initial spec.md file from template
    $SpecFile = Join-Path $ProgramDir "spec.md"
    $TemplateFile = Join-Path $RepoRoot "templates" "program-spec-template.md"
    
    if (Test-Path $TemplateFile) {
        Copy-Item $TemplateFile $SpecFile
        
        # Replace basic placeholders
        $content = Get-Content $SpecFile -Raw
        $content = $content -replace '\[PROGRAM_NAME\]', $ProgramName
        $content = $content -replace '\[###-program-name\]', $ProgramId
        $content = $content -replace '\[DATE\]', (Get-Date).ToString('yyyy-MM-dd')
        Set-Content -Path $SpecFile -Value $content -Encoding UTF8
    } else {
        # Create basic spec file if template doesn't exist
        $basicContent = @"
# Program Specification: $ProgramName

**Program ID**: ``$ProgramId``  
**Created**: $((Get-Date).ToString('yyyy-MM-dd'))  
**Status**: Draft  
**Input**: Program description: "$ProgramDescription"

## Program Requirements

[Content will be generated using /specify command]
"@
        Set-Content -Path $SpecFile -Value $basicContent -Encoding UTF8
    }
    
    # Output results
    if ($Json) {
        $result = @{
            PROGRAM_ID = $ProgramId
            PROGRAM_DIR = $ProgramDir
            SPEC_FILE = $SpecFile
            PROGRAM_NAME = $ProgramName
        } | ConvertTo-Json -Compress
        Write-Output $result
    } else {
        Write-Output "Created new NUAA program:"
        Write-Output "  Program ID: $ProgramId"
        Write-Output "  Directory: $ProgramDir"
        Write-Output "  Spec file: $SpecFile"
        Write-Output "  Ready for /specify command"
    }
} catch {
    Write-Error "Error creating program: $($_.Exception.Message)"
    exit 1
}