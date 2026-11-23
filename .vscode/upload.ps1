# 바뀐 파일을 모두 커밋하고 GitHub에 올리는 스크립트
# (Ctrl + Alt + U 또는 "2. GitHub에 올리기" 작업이 이 파일을 실행해요)

# 과제 폴더(이 파일이 든 .vscode의 바로 위 폴더)로 이동
Set-Location (Split-Path $PSScriptRoot)

# 바뀐 파일이 없으면 그냥 끝내기
if (-not (git status --porcelain)) {
    Write-Host '새로 바뀐 파일이 없어요.'
    exit 0
}

# 커밋 메시지: 예) "2026-11-23 수업 과제"
$message = (Get-Date -Format 'yyyy-MM-dd') + ' 수업 과제'

git add -A
git commit -m $message
if ($LASTEXITCODE -ne 0) {
    Write-Host '커밋에 실패했어요. 위의 오류 메시지를 확인해 주세요.' -ForegroundColor Red
    exit 1
}

git push
if ($LASTEXITCODE -ne 0) {
    Write-Host 'GitHub에 올리지 못했어요. 인터넷 연결이나 GitHub 로그인을 확인해 주세요.' -ForegroundColor Red
    exit 1
}

Write-Host '올리기 완료!' -ForegroundColor Green
