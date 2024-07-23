echo off
setlocal enabledelayedexpansion

git fetch
for /f "tokens=0 delims= " %%I in (git checkout -b temp origin/master) do (
    if (%%I == "fatal"):
        echo There are no commits as of now
        goto :end
    else :
        goto :SECOND
)

:SECOND
echo Recieaved commits
for /f "tokens=0 delims= " %%I in (git checkout master) do (
    if (%%I == "error"):
        echo Your local's main branch is 'main' not master. Go to Sol to fix the bat script
        goto :end
    git reset --hard temp
    git branch -d temp
    echo Succesfully replaced working directory
    goto :end
)

:end
echo Ending your pull request
