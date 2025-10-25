# ------------------------------------------------------------
# ARK DynamicConfig �Զ��л��ű���Windows��
# ÿ���� 18:00 �л�Ϊ�����
# ÿ��һ 00:00 �л���ͨ����
# ------------------------------------------------------------

$repoPath   = "C:\Users\Administrator\ark-configs"   # �� �ĳ����ʵ��·��
$normalFile = "$repoPath\DynamicConfig_Normal.ini"
$eventFile  = "$repoPath\DynamicConfig_Event.ini"
$targetFile = "$repoPath\DynamicConfig.ini"

# ��ȡ��ǰ����ʱ��
$day  = (Get-Date).DayOfWeek.value__
$hour = (Get-Date).Hour

# �ж�ʱ�䷶Χ
if (($day -eq 5 -and $hour -ge 18) -or ($day -eq 6) -or ($day -eq 0 -and $hour -lt 24)) {
    Copy-Item $eventFile $targetFile -Force
    Write-Host "? ���л������������ (Event)"
} else {
    Copy-Item $normalFile $targetFile -Force
    Write-Host "? ���л�����ͨ�������� (Normal)"
}

# ���͵� GitHub
Set-Location $repoPath
git add DynamicConfig.ini
$time = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "Auto update DynamicConfig $time"
git push origin main

Pause