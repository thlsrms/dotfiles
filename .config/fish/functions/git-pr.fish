#!/usr/bin/env fish
# git-pr: Fetch a git pull request from github or gitlab

function git-pr -a pr -d 'Fetch and pull a PR | Usage: git-pr <PR> --optionals <remote> gl | gl: GitLab or blank for Github'
    if count $argv > /dev/null
        set -f origin
        if [ (count $argv) -gt 1 ]
            set origin $argv[2]
        else
            set origin "origin"
        end

        set -f pullurl
        if [ (count $argv) -gt 2 ]; and contains 'gl' $argv[3]
            set pullurl "merge-requests"
        else
            set pullurl "pull"
        end

        command git fetch -fu $origin refs/$pullurl/$pr/head:pr/$pr
        command git checkout pr/$pr
    end
end
