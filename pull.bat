echo off
setlocal enabledelayedexpansion

git stash push -m "Stashed untracked files" --include-untracked
git fetch

git checkout -b temp origin/main 2>nul
if errorlevel == 1 (
    echo There are no commits as of now
    goto :end
) else {
    echo Recieaved commits
}
git checkout master 2>nul
if errorlevel == 1 :
    echo Your main branch isnt master. Talk to Sol to fix this.
    goto :end

git reset --hard temp
git branch -d temp
echo Succesfully replaced working directory
goto :end

:end
echo Ending your pull request