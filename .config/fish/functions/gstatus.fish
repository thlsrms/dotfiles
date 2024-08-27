#!/bin/env fish

function gstatus -d "Find .git folders in subdirectories and run git status"
    fd .git -Ha -t d -d 2 | xargs -I{} fish -c 'cd "$(dirname "{}")" && pwd && git status -s && echo -e'
end
