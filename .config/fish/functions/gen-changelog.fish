function gen-changelog -d "Generate a CHANGELOG.md file from conventional commits" -a target

    if test (count $argv) -eq 0
        set target main
    end

    # How should the message be formatted.
    # Author Name: (_%aN_) | Subject: %s | Abbr commit hash: %h | Date(YYYY-MM-DD): %as
    set -l log_format "%s (%h)"

    # Compare against HEAD (the latest commit).
    set -l source HEAD

    # Prefix each line with '- ' to render a Markdown list.
    set -l prefix '{print "- " $0}'
    set -l release_version (git semver get)
    set -l release_date (date +%Y/%m/%d)

    # Start writing the CHANGELOG.md 
    begin
        # Write changelog header
        echo -e "## Release [`$release_version`] - `$release_date`\n"
        echo -e "Release notes goes here.\n"

        # Examples following https://keepachangelog.com/en/1.1.0/ guidelines:
        # Filter to commits that pass the conventional commit format.
        # See: https://www.conventionalcommits.org/

        # New features matches on any line containing "feat:|feat(scope):"
        echo -e "### Added"
        git log --oneline --pretty=format:$log_format $source...$target \
            | grep -P "(?:^|\s)(feat)(\(\w+\))?:\s.+" \
            | sort -k1 \
            | awk "$prefix"
        echo "  "

        # Changes to existing functionality, any line containing "refactor: perf:| x(scope):"
        echo -e "### Changed"
        git log --oneline --pretty=format:$log_format $source...$target \
            | grep -P "(?:^|\s)(refactor|perf)(\(\w+\))?:\s.+" \
            | sort -k1 \
            | awk "$prefix"
        echo "  "

        # Bug fixes, any line containing "fix:|fix(scope):"
        echo -e "### Fixed"
        git log --oneline --pretty=format:$log_format $source...$target \
            | grep -P "(?:^|\s)(fix)(\(\w+\))?:\s.+" \
            | sort -k1 \
            | awk "$prefix"
        echo "  "

        # https://keepachangelog.com/en/1.1.0/ Also include other categories like:
        # "Deprecated, Removed, Security", change the regex to fit the filter.
        echo -e "### Others"
        git log --oneline --pretty=format:$log_format $source...$target \
            | grep -P "(?:^|\s)(?!feat|fix|refactor|perf)(\w+)(\(\w+\))?:\s.+" \
            | sort -k1 \
            | awk "$prefix"
        echo "  "

        # Example of a chronologically sorted changelog removing the date with `cut`
        # the `log_format` should have `%as` as it's first placeholder
        # cut needs to be changed accordingly to the `prefix`, if there's no prefix: -c 11-
        : '
        git log --oneline --pretty=format:$log_format $source...$target \
            | grep -P "(\w+)(\(\w+\))?:\s.+" \
            | sort -k1r \
            | awk "$prefix" \
            | cut -c 1-2,14-
        echo "  "
        '

        : '
        echo -e "### Anything"
        git log --oneline --pretty=format:$log_format $source...$target \
            | sort -k1 \
            | awk "$prefix"
        echo "  "
        '

        echo -e "---\n"
        cat CHANGELOG.md 2>/dev/null
    end | sponge CHANGELOG.md # pipe into `sponge` to replace the file
end
