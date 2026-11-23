# 오늘 날짜(YYYYMMDD) 폴더를 만드는 스크립트
# ("1. 오늘 수업 폴더 만들기" 작업이 이 파일을 실행해요)

# 과제 폴더(이 파일이 든 .vscode의 바로 위 폴더)로 이동
Set-Location (Split-Path $PSScriptRoot)

$today = Get-Date -Format 'yyyyMMdd'

if (Test-Path $today) {
    Write-Host "이미 있어요: $today"
} else {
    New-Item -ItemType Directory $today | Out-Null
    Write-Host "만들었어요: $today" -ForegroundColor Green
}
